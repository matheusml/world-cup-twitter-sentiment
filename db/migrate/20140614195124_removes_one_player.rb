class RemovesOnePlayer < ActiveRecord::Migration
  def change
  	p = Player.where(:name => "Hulk").first
  	p.destroy!
  end
end
