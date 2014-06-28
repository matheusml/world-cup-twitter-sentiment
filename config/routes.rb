WorldCupTwitterSentiment::Application.routes.draw do
  root :to => 'home#index'  

  match "/sobre" => "home#about", :as => :about, :via => :get
  match "/contato" => "home#contact", :as => :contact, :via => :get
  match "/limitacoes-e-desafios" => "home#limitations", :as => :limitations, :via => :get
  match "/selecao/:squad_id" => "home#index", :as => :squad, :via => :get
  match "/show_tweets/:player_id" => "home#show_tweets", :as => :show_tweets, :via => :get, :format => :js
end