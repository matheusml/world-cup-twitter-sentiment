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

	#players = get_players
	#squads = get_squads
	
	#stream(players, squads, client)
	stream('neymar', 'brasil', client)
end

private

def stream(players, squads, client)
	do_stream(players, 'jogadores.json', client)
	#do_stream(squads, 'selecao.json', client)
	#sleep(30 * 60)
	#stream(players, squads, client)
end

def do_stream(track, file_path, client)
	count = 0
	tweets = []
	client.track(track) do |status|
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