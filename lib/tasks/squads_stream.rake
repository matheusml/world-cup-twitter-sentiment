#encoding: utf-8

require "time"
require "json"

desc 'Streamming tweets'
task :squads_stream => [:environment] do
	squads = get_squads
	stream_squads(squads)
end

private

def stream_squads(squads)
	client = Twitter4j4r::Client.new(:consumer_key => 'BlpfM8bCI4RVELlc5PGhAg',
                                  :consumer_secret => 'IJYJ0ga6CP4sNBZ7pCgCFh73aocPXCTmbIKLYVbomIQ',
                                  :access_token => '15689757-hspmJBwuytAkFlJzKNUpvCIV0skcQbDyCKvrgTLag',
                                  :access_secret => '0lufFh9k1j5mQ2DtJ2PswvGIJrZTQfsbxkau0Gp6U0')

	puts "--- Iniciando o Stream de Selecoes"
	latch = java.util.concurrent.CountDownLatch.new(1)
	do_stream(squads, 'entrada.json', client, latch)
	latch.await
	SentimentClassifier.squads_classifier
	retrieve_tweets(Squad.all, 'saida.json', 'tweets_text.json')
	puts "--- Contador de Tweets: #{Tweet.count}"
end

def retrieve_tweets(entities, file_name, tweets_text_file)
	begin
		file = File.read(file_name)
		tweets = JSON.parse(file)
		tweets_text_file = File.read(tweets_text_file)
		tweets_text = JSON.parse(tweets_text_file)
		
		tweets["tweets"].each do |tweet|
			text = tweets_text[tweet["id"].to_s]
			entities_array = TweetProcesser.entities_contained_in_tweets(entities, text)
			save_tweet(entities_array, tweet, text)
		end
	rescue JSON::ParserError => e
		puts "--- #{e}"
	end
end

def save_tweet(entities, tweet, text)
	if entities.length == 1
		begin
			if keep_tweet(tweet)
				tweet["positive"] = true  if contains_positive_emoticon?(text)
				tweet["positive"] = false if contains_negative_emoticon?(text)

				entity = entities.first
	
				entity.tweets.create(:text => text,
														 :positive => tweet["positive"],
														 :confidence => tweet["polarity_confidence"],
														 :subjectivity_confidence => tweet["subjectivity_confidence"],
														 :date => DateTime.iso8601(tweet["date"]))
			end
		rescue ActiveRecord::StatementInvalid => error
			puts "--- #{error}"
		end
	end
end

def keep_tweet(tweet)
	tweet["polarity_confidence"] &&	tweet["polarity_confidence"] > 0.7  &&
  tweet["subjectivity_confidence"] && tweet["subjectivity_confidence"] > 0.95
end

def do_stream(track, file_path, client, latch)
  count = 0
	tweets = []
	tweets_text = {}
	client.track(*track) do |status|
	  if count == 50
	  	generate_json({:tweets => tweets}, file_path)
	  	sleep(3)
	  	generate_json(tweets_text, 'tweets_text.json')
	  	sleep(3)
		  client.stop
		  latch.count_down
	  else
	  	if status.iso_language_code == 'pt' && !status.text.include?('http') && TweetProcesser.keep_tweet?(status.text, track)
      	count += 1
      	tweets << { :id => count, :text => TweetProcesser.preprocess(status.text), :date => Date.today }
    		tweets_text[count] = status.text
    	end
    end
	end
end

def generate_json(tweets, file_path)	
	if File.exist?(file_path)
    File.delete(file_path) 
  end

  File.open(file_path,"w") do |f|
	  f.write(tweets.to_json)
  end
end

def get_squads
	track = []
	Squad.all.each do |squad|
		track << squad.name
	end
	track
end

def contains_positive_emoticon?(text)
	positive_emoticons.each do |emoticon|
		return true if text.include? emoticon
	end
	false
end

def contains_negative_emoticon?(text)
	negative_emoticons.each do |emoticon|
		return true if text.include? emoticon
	end
	false
end

def positive_emoticons
	%W{
			=D
			:D
			;-D
			:-)
			;)
			=)
			:)
			=]
			;]
			:]		
		}
end

def negative_emoticons
	%W{
		  :-(
			=(
			:(
			=(
			:(
			=/
			:/		
		}
end