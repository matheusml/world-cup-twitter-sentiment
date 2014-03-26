#encoding: utf-8

class PopulatesSquads < ActiveRecord::Migration
  def change
  	Squad.create!(:name => 'Brasil', :group => 'A')
  	Squad.create!(:name => 'Croácia', :group => 'A')
  	Squad.create!(:name => 'México', :group => 'A')
  	Squad.create!(:name => 'Camarões', :group => 'A')
  	
  	Squad.create!(:name => 'Espanha', :group => 'B')
  	Squad.create!(:name => 'Holanda', :group => 'B')
  	Squad.create!(:name => 'Chile', :group => 'B')
  	Squad.create!(:name => 'Austrália', :group => 'B')

  	Squad.create!(:name => 'Colômbia', :group => 'C')
  	Squad.create!(:name => 'Grécia', :group => 'C')
  	Squad.create!(:name => 'Costa do Marfim', :group => 'C')
  	Squad.create!(:name => 'Japão', :group => 'C')

  	Squad.create!(:name => 'Uruguai', :group => 'D')
  	Squad.create!(:name => 'Costa Rica', :group => 'D')
  	Squad.create!(:name => 'Inglaterra', :group => 'D')
  	Squad.create!(:name => 'Itália', :group => 'D')

  	Squad.create!(:name => 'Suíça', :group => 'E')
  	Squad.create!(:name => 'Equador', :group => 'E')
  	Squad.create!(:name => 'França', :group => 'E')
  	Squad.create!(:name => 'Honduras', :group => 'E')

  	Squad.create!(:name => 'Argentina', :group => 'F')
  	Squad.create!(:name => 'Bósnia', :group => 'F')
  	Squad.create!(:name => 'Irã', :group => 'F')
  	Squad.create!(:name => 'Nigéria', :group => 'F')

  	Squad.create!(:name => 'Alemanha', :group => 'G')
  	Squad.create!(:name => 'Portugal', :group => 'G')
  	Squad.create!(:name => 'Gana', :group => 'G')
  	Squad.create!(:name => 'Estados Unidos', :group => 'G')

  	Squad.create!(:name => 'Bélgica', :group => 'H')
  	Squad.create!(:name => 'Argélia', :group => 'H')
  	Squad.create!(:name => 'Rússia', :group => 'H')
  	Squad.create!(:name => 'Coreia do Sul', :group => 'H')
  end
end
