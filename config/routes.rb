WorldCupTwitterSentiment::Application.routes.draw do
  root :to => 'home#index'  

  match "/:squad_id" => "home#index", :as => :squad, :via => :get
end