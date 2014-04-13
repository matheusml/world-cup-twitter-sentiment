class PopulatesFakeTweetsForSquads < ActiveRecord::Migration
  def change
  	if Rails.env.development?
	  	squad = Squad.where(:name => 'Espanha').first
	  	squad.tweets.create(:text => 'Essa seleção vai longe', :positive => true, :date => Date.today)
	  	squad.tweets.create(:text => 'Essa seleção vai ser campeã', :positive => true, :date => Date.today)
	  	squad.tweets.create(:text => 'Não torço pra essa porcaria de seleção', :positive => false, :date => Date.today)
	  	squad.tweets.create(:text => 'Seleção campeã!', :positive => true, :date => (Date.today + 1.day))
	  	squad.tweets.create(:text => 'Seleção campeã do mundo!', :positive => true, :date => (Date.today + 1.day))
	  end
	end
end
