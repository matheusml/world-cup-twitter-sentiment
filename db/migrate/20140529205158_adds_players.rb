# encoding: UTF-8

class AddsPlayers < ActiveRecord::Migration
  def change
    Player.delete_all
    Tweet.delete_all
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
    squad.players.create(:name => 'Jefferson')
    squad.players.create(:name => 'Fred')
    squad.players.create(:name => 'Marcelo')
    squad.players.create(:name => 'Maicon')
    squad.players.create(:name => 'Maxwell')
    squad.players.create(:name => 'Dante')
    squad.players.create(:name => 'Luiz Gustavo')
    squad.players.create(:name => 'Fernandinho')
    squad.players.create(:name => 'Ramires')
    squad.players.create(:name => 'Hernanes')
    squad.players.create(:name => 'Willian')
    squad.players.create(:name => 'Jô')
  	squad.players.create(:name => 'Bernard')

    squad = Squad.where(:name => 'Croácia').first
    squad.players.create(:name => 'Srna')
    squad.players.create(:name => 'Modric')
    squad.players.create(:name => 'Rakitic')
    
    squad = Squad.where(:name => 'Camarões').first
    squad.players.create(:name => 'Etoo')

    squad = Squad.where(:name => 'México').first
    squad.players.create(:name => 'Chicarito')
    squad.players.create(:name => 'Giovani Dos Santos')

    squad = Squad.where(:name => 'Espanha').first
    squad.players.create(:name => 'Casillas')
    squad.players.create(:name => 'Sergio Ramos')
    squad.players.create(:name => 'Piqué')
    squad.players.create(:name => 'Xavi')
    squad.players.create(:name => 'Iniesta')
    squad.players.create(:name => 'Fábregas')
    squad.players.create(:name => 'David Silva')
    squad.players.create(:name => 'Fernando Torres')

    squad = Squad.where(:name => 'Holanda').first
    squad.players.create(:name => 'Van der Vaart')
    squad.players.create(:name => 'Van Persie')
    squad.players.create(:name => 'Kuyt')
    squad.players.create(:name => 'Robben')

    squad = Squad.where(:name => 'Chile').first
    squad.players.create(:name => 'Alexis Sanchez')
    squad.players.create(:name => 'Eduardo Vargas')
    squad.players.create(:name => 'Valdivia')
    squad.players.create(:name => 'Aránguiz')

    squad = Squad.where(:name => 'Colômbia').first
    squad.players.create(:name => 'Martínez')
    squad.players.create(:name => 'Falcão Garcia')

    squad = Squad.where(:name => 'Costa do Marfim').first
    squad.players.create(:name => 'Drogba')
    squad.players.create(:name => 'Yaya Toure')

    squad = Squad.where(:name => 'Uruguai').first
    squad.players.create(:name => 'Godin')
    squad.players.create(:name => 'Cavani')
    squad.players.create(:name => 'Suarez')
    squad.players.create(:name => 'Forlan')

    squad = Squad.where(:name => 'Inglaterra').first
    squad.players.create(:name => 'Gerrard')
    squad.players.create(:name => 'Lampard')
    squad.players.create(:name => 'Rooney')

    squad = Squad.where(:name => 'Itália').first
    squad.players.create(:name => 'Buffon')
    squad.players.create(:name => 'Pirlo')
    squad.players.create(:name => 'Balotelli')

    squad = Squad.where(:name => 'França').first
    squad.players.create(:name => 'Valbuena')
    squad.players.create(:name => 'Benzema')
    squad.players.create(:name => 'Ribery')

    squad = Squad.where(:name => 'Argentina').first
    squad.players.create(:name => 'Messi')
    squad.players.create(:name => 'Di Maria')
    squad.players.create(:name => 'Aguero')
    squad.players.create(:name => 'Higuain')

    squad = Squad.where(:name => 'Alemanha').first
    squad.players.create(:name => 'Neuer')
    squad.players.create(:name => 'Lahm')
    squad.players.create(:name => 'Gotze')
    squad.players.create(:name => 'Muller')
    squad.players.create(:name => 'Ozil')
    squad.players.create(:name => 'Schweinsteiger')
    squad.players.create(:name => 'Klose')

    squad = Squad.where(:name => 'Portugal').first
    squad.players.create(:name => 'Cristiano Ronaldo')
    squad.players.create(:name => 'Pepe')

    squad = Squad.where(:name => 'Bélgica').first
    squad.players.create(:name => 'Hazard')
  end
end
