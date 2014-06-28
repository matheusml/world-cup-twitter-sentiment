# encoding: UTF-8

class RemovesSomePlayers < ActiveRecord::Migration
  def change
  	p = Player.where(:name => 'Bernard').first
  	p.destroy

  	p = Player.where(:name => 'Fernandinho').first
  	p.destroy

  	p = Player.where(:name => 'Jefferson').first
  	p.destroy

  	p = Player.where(:name => 'Marcelo').first
  	p.destroy

  	p = Player.where(:name => 'Oscar').first
  	p.destroy

		p = Player.where(:name => 'Paulinho').first
  	p.destroy

  	p = Player.where(:name => 'Willian').first
  	p.destroy

  	p = Player.where(:name => 'Luiz Gustavo').first
  	p.destroy

  	p = Player.where(:name => 'Jô').first
  	p.destroy  	

  	p = Player.where(:name => 'Maxwell').first
  	p.destroy

  	p = Player.where(:name => 'Dante').first
  	p.destroy

	 	p = Player.where(:name => 'Srna').first
  	p.destroy

  	p = Player.where(:name => 'Valbuena').first
  	p.destroy

  	p = Player.where(:name => 'Pepe').first
  	p.destroy

  	p = Player.where(:name => 'Higuain').first
  	p.destroy

  	p = Player.where(:name => 'Martínez').first
  	p.destroy

  	p = Player.where(:name => 'Falcão Garcia').first
  	p.destroy

  end
end
