Rails.application.routes.draw do
  
  

  resources :amenities
  resources :rules
  resources :cities
  resources :areas
  devise_for :admins
  post '/rate' => 'rater#create', :as => 'rate'

  resources :rooms 
  put "like" => "home#upvote", as:'like_room'
  put "dislike" => "home#downvote",as:'dislike_room'
  	
  resources :user_dashboard
  resources :profiles

  get 'admin' => "dashboard#index"

  get 'user_dashboard'  => "user_dashboard#index", as: 'user_profile'
  get 'update_profile'  => "user_dashboard#edit", as: 'update_profile'
  
  devise_for :users

  root 'home#index'
  get '/listings' => "home#listings" , as:'listings'
  get '/listing' => "home#listing" , as:'listing'

  delete '/delpic' => "rooms#delpic"
  delete '/delprofilepic' => "profiles#delprofilepic", as: 'delete_profile_pic'
  post '/profilepic_upload' => "profiles#uploadprofilepic"
end
