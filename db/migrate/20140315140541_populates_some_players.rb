# encoding: UTF-8

class PopulatesSomePlayers < ActiveRecord::Migration
  def change
  	squad = Squad.where(:name => 'Brasil').first

  	squad.players.create(:name => 'Neymar')
  	squad.players.create(:name => 'Felipão')
  	squad.players.create(:name => 'Júlio César')
  	squad.players.create(:name => 'Thiago Silva')
  	squad.players.create(:name => 'David Luiz')
  	squad.players.create(:name => 'Daniel Alves')
  	squad.players.create(:name => 'Oscar')
  	squad.players.create(:name => 'Paulinho')
  	squad.players.create(:name => 'Hulk')
  end
end
