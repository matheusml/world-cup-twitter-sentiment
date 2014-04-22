# encoding: UTF-8

class PopulatesFakePositivePercentageForDevMode < ActiveRecord::Migration
  def change
  	#if Rails.env.development?
	  	squad = Squad.where(:name => 'Brasil').first
	  	squad.update_attributes(:positive_percentage => 73)

	  	player = Player.where(:name => 'Neymar').first
	  	player.update_attributes(:positive_percentage => 89)

	  	player = Player.where(:name => 'Felipão').first
	  	player.update_attributes(:positive_percentage => 81)
	  	
	  	player = Player.where(:name => 'Júlio César').first
	  	player.update_attributes(:positive_percentage => 75)
	  	
	  	player = Player.where(:name => 'Thiago Silva').first
	  	player.update_attributes(:positive_percentage => 79)
	  	
	  	player = Player.where(:name => 'David Luiz').first
	  	player.update_attributes(:positive_percentage => 78)
	  	
	  	player = Player.where(:name => 'Daniel Alves').first
	  	player.update_attributes(:positive_percentage => 68)

	  	player = Player.where(:name => 'Oscar').first
	  	player.update_attributes(:positive_percentage => 70)

			player = Player.where(:name => 'Paulinho').first
	  	player.update_attributes(:positive_percentage => 85)

	  	player = Player.where(:name => 'Hulk').first
	  	player.update_attributes(:positive_percentage => 53)
  	#end
  end
end
