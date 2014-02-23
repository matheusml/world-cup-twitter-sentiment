class HomeController < ApplicationController
	def index
		@squads = Squad.all
		@active_squad = @squads.first
	end
end
