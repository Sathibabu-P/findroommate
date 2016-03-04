Rails.application.routes.draw do
  
  

  post '/rate' => 'rater#create', :as => 'rate'

  resources :rooms  do
  	member do 
  		put "like" => "rooms#upvote"
  		put "dislike" => "rooms#downvote"
  	end
  end
  	
  resources :user_dashboard
  resources :profiles
  get 'admin' => "dashboard#index"

  get 'user_dashboard'  => "user_dashboard#index", as: 'user_profile'
  get 'update_profile'  => "user_dashboard#edit", as: 'update_profile'

  devise_for :users

  root 'home#index'

  delete '/delpic' => "rooms#delpic"
end
