class AddsSubjectivtyConfideenceToTweets < ActiveRecord::Migration
  def change
  	add_column :tweets, :subjectivity_confidence, :float
  end
end
