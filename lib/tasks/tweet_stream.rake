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

	stream(['neymar', 'messi', 'iniesta', 'rooney', 'xavi', 'ronaldo', 'benzema', 'guardiola', 'modric'])
	#stream(['seleção'])
end

private

def stream(track)
	file = File.new('jogadores.txt', 'a')
	#file = File.new('selecao.txt', 'a')

	tweets = 0
	TweetStream::Client.new.track(track, language: 'pt') do |status|
		tweets += 1
		puts "#{tweets}) #{status.text}"
		file.puts "#{tweets}) #{status.text}"
		#break if tweets == 300
		if tweets == 500
			file.close
			return
		end
	end

	#sleep(3)
	#stream(track)
end