class HomeController < ApplicationController
	def index
		@squads = Squad.all.sort_by{|s| s.name}
		@active_squad = params[:squad_id] ? Squad.find(params[:squad_id]) : Squad.where(:name => 'Brasil').first
		@players = @active_squad.players.sort_by{|s| s.name}

		@chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:xAxis][:categories] = world_cup_dates
      f.options[:yAxis][:min] = 0
      f.options[:yAxis][:max] = 100
      f.series(:type=> 'spline',:name=> '% Tweets positivos', :data=> PlayerTweets.tweets_percentage(@active_squad, world_cup_dates))
    end
	end

	def show_tweets
		@player = Player.find params[:player_id]
		@chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:xAxis][:categories] = world_cup_dates
      f.options[:yAxis][:min] = 0
      f.options[:yAxis][:max] = 100
      f.series(:type=> 'spline',:name=> '% Tweets positivos', :data=> PlayerTweets.tweets_percentage(@player, world_cup_dates))
    end
	end

	def get_tweets
		TweetStream.configure do |config|
		  config.consumer_key       = 'BlpfM8bCI4RVELlc5PGhAg'
		  config.consumer_secret    = 'IJYJ0ga6CP4sNBZ7pCgCFh73aocPXCTmbIKLYVbomIQ'
		  config.oauth_token        = '15689757-hspmJBwuytAkFlJzKNUpvCIV0skcQbDyCKvrgTLag'
		  config.oauth_token_secret = '0lufFh9k1j5mQ2DtJ2PswvGIJrZTQfsbxkau0Gp6U0'
		  config.auth_method        = :oauth
		end

		TweetStream::Client.new.track(params[:track], language: 'en') do |status|
	  	@tweets = status.text
	  	break
		end

		render json: @tweets
	end

	def about
	end

	private

	def world_cup_dates
		['12/06', '13/06', '14/06', '15/06', '16/06',
		 '17/06', '18/06', '19/06', '20/06', '21/06',
		 '22/06', '23/06', '24/06', '25/06', '26/06',
		 '27/06', '28/06', '29/06', '30/06', '01/07',
		 '02/07', '03/07', '04/07', '05/07', '06/07',
		 '07/07', '08/07', '09/07', '10/07', '11/07',
		 '12/07']
	end
end
