class AddsConfidenceToTweets < ActiveRecord::Migration
  def change
  	add_column :tweets, :confidence, :float
  end
end
