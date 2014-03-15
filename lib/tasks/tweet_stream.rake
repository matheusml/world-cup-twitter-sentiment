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

	stream('neymar')
end

private

def stream(track)
	tweets = 0
	TweetStream::Client.new.track(track) do |status|
	#TweetStream::Client.new.track('neymar', language: 'pt') do |status|
		puts "#{status.text}"
		tweets += 1
		break if tweets == 3
	end

	sleep(3)
	stream(track)
end