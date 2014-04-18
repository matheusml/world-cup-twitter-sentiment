class HomeController < ApplicationController
	def index
		@squads = Squad.all
		@active_squad = params[:squad_id] ? Squad.find(params[:squad_id]) : @squads.first
		@players = @active_squad.players

		@chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:xAxis][:categories] = world_cup_dates
      f.series(:type=> 'spline',:name=> '% Tweets positivos', :data=> [30, 95, 75, 63.3, 71, 72, 30, 95, 75, 63.3, 71, 72])
    end
	end

	def show_tweets
		@player = Player.find params[:player_id]
		@chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:xAxis][:categories] = world_cup_dates
      f.series(:type=> 'spline',:name=> '% Tweets positivos', :data=> [30, 95, 75, 63.3, 71])
    end
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
