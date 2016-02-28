Rails.application.routes.draw do
  
  post '/rate' => 'rater#create', :as => 'rate'

  resources :rooms  do
  	member do 
  		put "like" => "rooms#upvote"
  		put "dislike" => "rooms#downvote"
  	end
  end
  	
  
  get 'admin' => "dashboard#index"

  devise_for :users
  root 'home#index'

  delete '/delpic' => "rooms#delpic"
end
