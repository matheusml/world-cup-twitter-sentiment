class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
    	t.string :text
    	t.boolean :positive
    	t.integer :tweetable_id
      t.string  :tweetable_type
      t.timestamps
    end
  end
end
