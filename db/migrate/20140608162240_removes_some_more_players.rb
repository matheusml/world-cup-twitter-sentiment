#encoding: utf-8

class RemovesSomeMorePlayers < ActiveRecord::Migration
  def change
  	p = Player.where(:name => "Maicon").first
  	p.destroy
  	p = Player.where(:name => "Hernanes").first
  	p.destroy
  	p = Player.where(:name => "Júlio César").first
  	p.destroy
  	p = Player.where(:name => "Ramires").first
  	p.destroy
  	p = Player.where(:name => "Neuer").first
  	p.destroy
  	p = Player.where(:name => "Muller").first
  	p.destroy
  	p = Player.where(:name => "Schweinsteiger").first
  	p.destroy
  	p = Player.where(:name => "Di Maria").first
  	p.destroy
  	p = Player.where(:name => "Aguero").first
  	p.destroy
  	p = Player.where(:name => "Etoo").first
  	p.destroy
  	p = Player.where(:name => "Alexis Sanchez").first
  	p.destroy
  	p = Player.where(:name => "Aránguiz").first
  	p.destroy
  	p = Player.where(:name => "Eduardo Vargas").first
  	p.destroy
  	p = Player.where(:name => "Valdivia").first
  	p.destroy
  	p = Player.where(:name => "David Silva").first
  	p.destroy
  	p = Player.where(:name => "Fábregas").first
  	p.destroy
  	p = Player.where(:name => "Casillas").first
  	p.destroy
  	p = Player.where(:name => "Sergio Ramos").first
  	p.destroy
  	p = Player.where(:name => "Piqué").first
  	p.destroy
  	p = Player.where(:name => "Ribery").first
  	p.destroy
  	p = Player.where(:name => "Van der Vaart").first
  	p.destroy
  	p = Player.where(:name => "Kuyt").first
  	p.destroy
  	p = Player.where(:name => "Buffon").first
  	p.destroy
  	p = Player.where(:name => "Giovani Dos Santos").first
  	p.destroy
  	p = Player.where(:name => "Godin").first
  	p.destroy
  	p = Player.where(:name => "Forlan").first
  	p.destroy
  	p = Player.where(:name => "Cavani").first
  	p.destroy
  end
end
