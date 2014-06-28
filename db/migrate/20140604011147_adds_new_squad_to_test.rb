#encoding: utf-8

class AddsNewSquadToTest < ActiveRecord::Migration
  def change
  	Squad.create!(:name => 'Seleção Brasileira', :group => 'A')
  end
end
