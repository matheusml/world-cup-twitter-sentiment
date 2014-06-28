#encoding: utf-8

class RemovesSomeMoreSquads < ActiveRecord::Migration
  def change
  	s = Squad.where(:name => 'Bélgica').first
  	s.destroy!
  	s = Squad.where(:name => 'Uruguai').first
  	s.destroy!
  	s = Squad.where(:name => 'Camarões').first
  	s.destroy!
  	s = Squad.where(:name => 'México').first
  	s.destroy!
  	s = Squad.where(:name => 'Croácia').first
  	s.destroy!
  	s = Player.where(:name => 'Lahm').first
  	s.destroy!
  	s = Player.where(:name => 'Gotze').first
  	s.destroy!
  	s = Player.where(:name => 'Felipão').first
  	s.destroy!
  end
end
