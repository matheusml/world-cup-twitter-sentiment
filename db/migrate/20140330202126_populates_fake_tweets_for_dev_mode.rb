# encoding: UTF-8

class PopulatesFakeTweetsForDevMode < ActiveRecord::Migration
  def change
  	if Rails.env.development?
	  	player = Player.where(:name => 'Neymar').first
	  	player.tweets.create(:text => 'Neymar é muito ruim', :positive => false, :date => Date.today)
	  	player.tweets.create(:text => 'Neymar vai ser o melhor!', :positive => true, :date => Date.today)
	  	player.tweets.create(:text => 'Neymar melhor em campo', :positive => true, :date => Date.today)
	  	player.tweets.create(:text => 'Neymar artilheiro!', :positive => true, :date => (Date.today + 1.day))
	  	player.tweets.create(:text => 'Neymar é o pior', :positive => false, :date => (Date.today + 1.day))
	  
	  	squad = Squad.where(:name => 'Brasil').first
	  	squad.tweets.create(:text => 'Essa seleção vai longe', :positive => true, :date => Date.today)
	  	squad.tweets.create(:text => 'Essa seleção vai ser campeã', :positive => true, :date => Date.today)
	  	squad.tweets.create(:text => 'Não torço pra essa porcaria de seleção', :positive => false, :date => Date.today)
	  	squad.tweets.create(:text => 'Seleção campeã!', :positive => true, :date => (Date.today + 1.day))
	  	squad.tweets.create(:text => 'Seleção campeã do mundo!', :positive => true, :date => (Date.today + 1.day))
	  end
  end
end
