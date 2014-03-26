class AddsGroupFieldToSquads < ActiveRecord::Migration
  def change
  	add_column :squads, :group, :string
  end
end
