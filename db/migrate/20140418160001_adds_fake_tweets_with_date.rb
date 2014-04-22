class AddsFakeTweetsWithDate < ActiveRecord::Migration
  def change
  	#if Rails.env.development?
  		date = Date.new(2014, 6, 12)

	  	player = Player.where(:name => 'Neymar').first
	  	player.tweets.create(:text => 'Neymar é muito ruim', :positive => false, :date => date)
	  	player.tweets.create(:text => 'Neymar vai ser o melhor!', :positive => true, :date => date)
	  	player.tweets.create(:text => 'Neymar melhor em campo', :positive => true, :date => (date + 1.day))
	  	player.tweets.create(:text => 'Neymar artilheiro!', :positive => true, :date => (date + 1.day))
	  	player.tweets.create(:text => 'Neymar é o pior..', :positive => false, :date => (date + 2.day))
	  	player.tweets.create(:text => 'Neymar é o pior..', :positive => true, :date => (date + 2.day))
	  	player.tweets.create(:text => 'Neymar é o pior!!', :positive => false, :date => (date + 3.day))
	  	player.tweets.create(:text => 'Neymar é o pior!!', :positive => true, :date => (date + 3.day))
	  
	  	squad = Squad.where(:name => 'Brasil').first
	  	squad.tweets.create(:text => 'Essa seleção vai longe', :positive => true, :date => date)
	  	squad.tweets.create(:text => 'Essa seleção vai ser campeã', :positive => true, :date => date)
	  	squad.tweets.create(:text => 'Não torço pra essa porcaria de seleção', :positive => false, :date => date)
	  	squad.tweets.create(:text => 'Seleção campeã!', :positive => true, :date => (date + 1.day))
	  	squad.tweets.create(:text => 'Seleção campeã do mundo!', :positive => true, :date => (date + 1.day))
	  	squad.tweets.create(:text => 'Seleção campeã do mundo!', :positive => true, :date => (date + 1.day))
	  	squad.tweets.create(:text => 'Seleção campeã do mundo!', :positive => false, :date => (date + 1.day))
	  	squad.tweets.create(:text => 'Seleção campeã do mundo!', :positive => true, :date => (date + 2.day))
	  	squad.tweets.create(:text => 'Seleção campeã do mundo!', :positive => false, :date => (date + 2.day))
	  	squad.tweets.create(:text => 'Seleção campeã do mundo!', :positive => true, :date => (date + 2.day))
	  	squad.tweets.create(:text => 'Seleção campeã do mundo!', :positive => true, :date => (date + 3.day))
	  #end
  end
end
