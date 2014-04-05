class HomeController < ApplicationController
	def index
		@squads = Squad.all
		@active_squad = params[:squad_id] ? Squad.find(params[:squad_id]) : @squads.first
		@players = @active_squad.players

		@chart = LazyHighCharts::HighChart.new('graph') do |f|
		  f.title(:text => "Population vs GDP For 5 Big Countries [2009]")
		  f.xAxis(:categories => ["United States", "Japan", "China", "Germany", "France"])
		  f.series(:name => "GDP in Billions", :yAxis => 0, :data => [14119, 5068, 4985, 3339, 2656])
		  f.series(:name => "Population in Millions", :yAxis => 1, :data => [310, 127, 1340, 81, 65])

		  f.yAxis [
		    {:title => {:text => "GDP in Billions", :margin => 70} },
		    {:title => {:text => "Population in Millions"}, :opposite => true},
		  ]

		  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
		  f.chart({:defaultSeriesType=>"column"})
		end
	end
end
