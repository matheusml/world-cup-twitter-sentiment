WorldCupTwitterSentiment::Application.routes.draw do
  root :to => 'home#index'  

  match "/sobre" => "home#about", :as => :about, :via => :get
  match "/selecao/:squad_id" => "home#index", :as => :squad, :via => :get
  match "/show_tweets/:player_id" => "home#show_tweets", :as => :show_tweets, :via => :get, :format => :js
  
  match "/get_tweets" => "home#get_tweets", :as => :get_tweets, :via => :get, :format => :json
end