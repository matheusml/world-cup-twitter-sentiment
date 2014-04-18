#encoding: utf-8

require 'tweetstream'
require "time"

desc 'Streamming tweets'
task :tweet_stream => [:environment] do

	TweetStream.configure do |config|
	   config.consumer_key       = 'BlpfM8bCI4RVELlc5PGhAg'
	   config.consumer_secret    = 'IJYJ0ga6CP4sNBZ7pCgCFh73aocPXCTmbIKLYVbomIQ'
	   config.oauth_token        = '15689757-hspmJBwuytAkFlJzKNUpvCIV0skcQbDyCKvrgTLag'
	   config.oauth_token_secret = '0lufFh9k1j5mQ2DtJ2PswvGIJrZTQfsbxkau0Gp6U0'
	   config.auth_method        = :oauth
	end

	stream(tracked_players_and_squads)
end

private

def stream(track)
	tweets = 0
	TweetStream::Client.new.track(track, language: 'pt') do |status|
		tweets += 1
		return if tweets == 500
	end

	sleep(30 * 60)
	stream(track)
end

def tracked_players_and_squads
	track = []
	Player.each do |player|
		track << player.name
	end
	Squad.each do |squad|
		track << squad.name
	end
end