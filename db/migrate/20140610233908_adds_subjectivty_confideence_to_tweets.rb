class AddsSubjectivtyConfideenceToTweets < ActiveRecord::Migration
  def change
  	add_column :tweets, :subjectivity_confidence, :boolean
  end
end
