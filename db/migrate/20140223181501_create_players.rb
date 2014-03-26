class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
    	t.string :name
    	t.decimal :positive_percentage
    	t.belongs_to :squad
    	
      t.timestamps
    end
  end
end
