#encoding: utf-8

require "time"
require "json"

desc 'Streamming tweets'
task :tweet_stream => [:environment] do
	players = get_players
	squads = get_squads
	stream(players, squads)
end

private

def stream(players, squads)
	stream_players(players)
	stream_squads(squads)
end

def stream_players(players)
	client = Twitter4j4r::Client.new(:consumer_key => 'BlpfM8bCI4RVELlc5PGhAg',
                                  :consumer_secret => 'IJYJ0ga6CP4sNBZ7pCgCFh73aocPXCTmbIKLYVbomIQ',
                                  :access_token => '15689757-hspmJBwuytAkFlJzKNUpvCIV0skcQbDyCKvrgTLag',
                                  :access_secret => '0lufFh9k1j5mQ2DtJ2PswvGIJrZTQfsbxkau0Gp6U0')

	puts "--- Iniciando o Stream de Jogadores"
	latch = java.util.concurrent.CountDownLatch.new(1)
	do_stream(players, 'entrada.json', client, 50, latch)
	latch.await
	SentimentClassifier.players_classifier
	retrieve_tweets(Player.all, 'saida.json', 'tweets_text.json')
	puts "--- Contador de Tweets: #{Tweet.count}"
end

def stream_squads(squads)
	client = Twitter4j4r::Client.new(:consumer_key => 'BlpfM8bCI4RVELlc5PGhAg',
                                  :consumer_secret => 'IJYJ0ga6CP4sNBZ7pCgCFh73aocPXCTmbIKLYVbomIQ',
                                  :access_token => '15689757-hspmJBwuytAkFlJzKNUpvCIV0skcQbDyCKvrgTLag',
                                  :access_secret => '0lufFh9k1j5mQ2DtJ2PswvGIJrZTQfsbxkau0Gp6U0')

	puts "--- Iniciando o Stream de Selecoes"
	latch = java.util.concurrent.CountDownLatch.new(1)
	do_stream(squads, 'entrada.json', client, 50, latch)
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
			entities_array = entities_contained_in_tweets(entities, text)
			save_tweet(entities_array, tweet, text)
		end
	rescue JSON::ParserError => e
		puts "--- #{e}"
	end
end

def save_tweet(entities, tweet, text)
	entities.each do |entity|
		begin
			entity.tweets.create(:text => text,
												 :positive => tweet["positive"],
												 :confidence => tweet["confidence"],
												 :date => DateTime.iso8601(tweet["date"]))
		rescue ActiveRecord::StatementInvalid => error
			puts "--- #{error}"
		end
	end
end

def entities_contained_in_tweets(entities, text)
	entities_array = []
	entities.each do |entity|
		entities_array << entity if text.downcase.include? entity.name.downcase
	end
	entities_array
end

def do_stream(track, file_path, client, number_of_tweets, latch)
  count = 0
	tweets = []
	tweets_text = {}
	client.track(*track) do |status|
	  if count == number_of_tweets
	  	generate_json({:tweets => tweets}, file_path)
	  	generate_json(tweets_text, 'tweets_text.json')
		  client.stop
		  latch.count_down
	  else
	  	if status.iso_language_code == 'pt'
      	count += 1
      	tweets << { :id => count, :text => TweetProcesser.preprocess(track, status.text), :date => Date.today }
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

def get_players
	track = []
	Player.all.each do |player|
		track << player.name
	end
	track
end