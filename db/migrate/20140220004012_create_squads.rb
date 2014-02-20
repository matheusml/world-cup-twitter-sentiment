class CreateSquads < ActiveRecord::Migration
  def change
    create_table :squads do |t|
    	t.string :name
    	t.decimal :positive_percentage
    	
      t.timestamps
    end
  end
end
