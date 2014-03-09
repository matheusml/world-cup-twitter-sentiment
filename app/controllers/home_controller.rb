require 'tweetstream'

class HomeController < ApplicationController
	def index
		TweetStream.configure do |config|
		  config.consumer_key       = 'BlpfM8bCI4RVELlc5PGhAg'
		  config.consumer_secret    = 'IJYJ0ga6CP4sNBZ7pCgCFh73aocPXCTmbIKLYVbomIQ'
		  config.oauth_token        = '15689757-hspmJBwuytAkFlJzKNUpvCIV0skcQbDyCKvrgTLag'
		  config.oauth_token_secret = '0lufFh9k1j5mQ2DtJ2PswvGIJrZTQfsbxkau0Gp6U0'
		  config.auth_method        = :oauth
		end
		
		TweetStream::Client.new.track('messi', language: 'pt') do |status|
		  puts "#{status.text}"
		end

		@squads = Squad.all
		@active_squad = params[:squad_id] ? Squad.find(params[:squad_id]) : @squads.first
		@players = @active_squad.players
	end
end
