#encoding: utf-8

#require 'tweetstream'
require "time"
require 'json'

desc 'Streamming tweets'
task :tweet_stream => [:environment] do

	client = Twitter4j4r::Client.new(:consumer_key => 'BlpfM8bCI4RVELlc5PGhAg',
                                  :consumer_secret => 'IJYJ0ga6CP4sNBZ7pCgCFh73aocPXCTmbIKLYVbomIQ',
                                  :access_token => '15689757-hspmJBwuytAkFlJzKNUpvCIV0skcQbDyCKvrgTLag',
                                  :access_secret => '0lufFh9k1j5mQ2DtJ2PswvGIJrZTQfsbxkau0Gp6U0')

	players = get_players
	squads = get_squads
	
	stream(players, squads, client)
	#stream('neymar', 'brasil', client)
end

private

def stream(players, squads, client)
	#do_stream(players, 'jogadores.json', client)
	retrieve_tweets(Player.all, 'saida.json')
	#do_stream(squads, 'selecao.json', client)
	#sleep(30 * 60)
	#stream(players, squads, client)
end

def retrieve_tweets(entities, file_name)
	file = File.read(file_name, :encoding => 'iso-8859-1')
	tweets = JSON.parse(file)
	tweets["tweets"].each do |tweet|
		entities_array = entities_contained_in_tweets(entities, tweet["text"])
		save_tweet(entities_array, tweet)
	end
end

def save_tweet(entities, tweet)
	entities.each do |entity|
		entity.tweets.create(:text => tweet["text"],
												 :positive => tweet["positive"],
												 :confidence => tweet["confidence"],
												 :date => DateTime.iso8601(tweet["date"]))
	end
end

def entities_contained_in_tweets(entities, text)
	entities_array = []
	entities.each do |entity|
		entities_array << entity if text.downcase.include? entity.name.downcase
	end
	entities_array
end

def do_stream(track, file_path, client)
  count = 0
	tweets = []
	client.track(*track) do |status|
	  if count == 3
	  	generate_json({:tweets => tweets}, file_path)
		  client.stop
	  else
	  	if status.iso_language_code == 'pt'
      	count += 1
      	tweets << { :text => status.text, :date => Date.today }
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