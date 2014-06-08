require "time"

class HomeController < ApplicationController
	def index
		@squads = Squad.all.sort_by{|s| s.name}
		@active_squad = params[:squad_id] ? Squad.find(params[:squad_id]) : Squad.where(:name => 'Brasil').first
		@tweets = @active_squad.tweets.where("date >= ? and text NOT LIKE ?", Date.today, '%RT %').order('confidence DESC').limit(10)
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
		@tweets = @player.tweets.where("date >= ? and text NOT LIKE ?", Date.today, '%RT %').order('confidence DESC').limit(10)
		
		@chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:xAxis][:categories] = world_cup_dates
      f.options[:yAxis][:min] = 0
      f.options[:yAxis][:max] = 100
      f.series(:type=> 'spline',:name=> '% Tweets positivos', :data=> PlayerTweets.tweets_percentage(@player, world_cup_dates))
    end
	end

	def about
	end

	private

	def world_cup_dates
		['06/06', '07/06', '08/06', '09/06', '10/06', '11/06']
=begin		
		['12/06', '13/06', '14/06', '15/06', '16/06',
		 '17/06', '18/06', '19/06', '20/06', '21/06',
		 '22/06', '23/06', '24/06', '25/06', '26/06',
		 '27/06', '28/06', '29/06', '30/06', '01/07',
		 '02/07', '03/07', '04/07', '05/07', '06/07',
		 '07/07', '08/07', '09/07', '10/07', '11/07',
		 '12/07', '13/07']
=end
	end
end
