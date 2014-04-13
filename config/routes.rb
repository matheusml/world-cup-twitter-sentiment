WorldCupTwitterSentiment::Application.routes.draw do
  root :to => 'home#index'  

  match "/:squad_id" => "home#index", :as => :squad, :via => :get
  match "/show_tweets/:player_id" => "home#show_tweets", :as => :show_tweets, :via => :get, :format => :js
end