class HomeController < ApplicationController
	def index
		@squads = Squad.all
		@active_squad = params[:squad_id] ? Squad.find(params[:squad_id]) : @squads.first
		@players = @active_squad.players

		@chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:xAxis][:categories] = ['01/07', '02/07', '03/07', '04/07', '05/07']
      f.series(:type=> 'spline',:name=> '% Tweets positivos', :data=> [30, 95, 75, 63.3, 71])
    end
	end

	def show_tweets
		@player = Player.find params[:player_id]
		@chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:xAxis][:categories] = ['01/07', '02/07', '03/07', '04/07', '05/07']
      f.series(:type=> 'spline',:name=> '% Tweets positivos', :data=> [30, 95, 75, 63.3, 71])
    end
	end
end
