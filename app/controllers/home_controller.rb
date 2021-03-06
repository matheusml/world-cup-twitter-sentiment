require "time"

class HomeController < ApplicationController
	def index
		@squads = Squad.all.sort_by{|s| s.name}
		@active_squad = params[:squad_id] ? Squad.find(params[:squad_id]) : Squad.where(:name => 'Brasil').first

		positive_tweets = @active_squad.tweets.where("date >= ? AND positive = ?", Date.new(2014, 7, 13), true).order('confidence DESC').limit(10)
		positive_tweets = positive_tweets.uniq_by {|i| i.text}

		negative_tweets = @active_squad.tweets.where("date >= ? AND positive = ?", Date.new(2014, 7, 13), false).order('confidence DESC').limit(10)
		negative_tweets = negative_tweets.uniq_by {|i| i.text}

		@tweets = ( positive_tweets + negative_tweets ).sort_by{|x| x.created_at}.reverse.first(10)

		@players = @active_squad.players.sort_by{|s| s.name}

		@chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:xAxis][:categories] = PlayerTweets.dates(@active_squad, world_cup_dates)
      f.options[:yAxis][:min] = 0
      f.options[:yAxis][:max] = 100
      f.series(:type=> 'spline',:name=> 'Tweets positivos (%)', :data=> PlayerTweets.tweets_percentage(@active_squad, world_cup_dates))
    end
	end

	def show_tweets
		@player = Player.find params[:player_id]

		positive_tweets = @player.tweets.where("date >= ? AND positive = ?", Date.new(2014, 7, 13), true).order('confidence DESC').limit(10)
		positive_tweets = positive_tweets.uniq_by {|i| i.text}

		negative_tweets = @player.tweets.where("date >= ? AND positive = ?", Date.new(2014, 7, 13), false).order('confidence DESC').limit(10)
		negative_tweets = negative_tweets.uniq_by {|i| i.text}

		@tweets = ( positive_tweets + negative_tweets ).sort_by{|x| x.created_at}.reverse.first(10)
		
		@chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:xAxis][:categories] = PlayerTweets.dates(@player, world_cup_dates)
      f.options[:yAxis][:min] = 0
      f.options[:yAxis][:max] = 100
      f.series(:type=> 'spline',:name=> 'Tweets positivos (%)', :data=> PlayerTweets.tweets_percentage(@player, world_cup_dates))
    end
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
		 '12/07', '13/07']
	end
end
