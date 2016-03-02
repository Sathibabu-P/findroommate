Rails.application.routes.draw do
  
  

  post '/rate' => 'rater#create', :as => 'rate'

  resources :rooms  do
  	member do 
  		put "like" => "rooms#upvote"
  		put "dislike" => "rooms#downvote"
  	end
  end
  	
  resources :user_dashboard
  get 'admin' => "dashboard#index"

  get 'user_dashboard'  => "user_dashboard#index", as: 'profile'

  devise_for :users
  root 'home#index'

  delete '/delpic' => "rooms#delpic"
end
