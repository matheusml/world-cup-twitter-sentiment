class HomeController < ApplicationController
	def index
		@squads = Squad.all
		@active_squad = params[:squad_id] ? Squad.find(params[:squad_id]) : @squads.first
		@players = @active_squad.players
	end
end
