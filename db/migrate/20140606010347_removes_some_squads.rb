#encoding: utf-8

class RemovesSomeSquads < ActiveRecord::Migration
  def change
  	s = Squad.where(:name => 'Austrália').first
  	s.destroy!
  	s = Squad.where(:name => 'Colômbia').first
  	s.destroy!
  	s = Squad.where(:name => 'Grécia').first
  	s.destroy!
  	s = Squad.where(:name => 'Costa do Marfim').first
  	s.destroy!
  	s = Squad.where(:name => 'Japão').first
  	s.destroy!
  	s = Squad.where(:name => 'Costa Rica').first
  	s.destroy!
  	s = Squad.where(:name => 'Suíça').first
  	s.destroy!
  	s = Squad.where(:name => 'Equador').first
  	s.destroy!
  	s = Squad.where(:name => 'Honduras').first
  	s.destroy!
  	s = Squad.where(:name => 'Bósnia').first
  	s.destroy!
  	s = Squad.where(:name => 'Irã').first
  	s.destroy!
  	s = Squad.where(:name => 'Nigéria').first
  	s.destroy!
  	s = Squad.where(:name => 'Gana').first
  	s.destroy!
  	s = Squad.where(:name => 'Estados Unidos').first
  	s.destroy!
  	s = Squad.where(:name => 'Argélia').first
  	s.destroy!
	 	s = Squad.where(:name => 'Rússia').first
  	s.destroy!
  	s = Squad.where(:name => 'Coreia do Sul').first
  	s.destroy!
  	s = Squad.where(:name => 'Seleção Brasileira').first
  	s.destroy!
  end
end
