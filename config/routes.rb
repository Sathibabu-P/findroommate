Rails.application.routes.draw do

  root 'home#index'
  
  devise_for :users
  devise_for :admins

  resources :amenities
  resources :rules
  resources :cities do
    collection { post :import }
  end
  resources :areas
  
  resources :user_dashboard
  resources :profiles
  resources :rooms 
  resources :admin_rooms 
  
  get '/update_areas' => "areas#list", :as => 'update_areas'
 
  put "like" => "home#upvote", as:'like_room'
  put "dislike" => "home#downvote",as:'dislike_room'
  post '/rate' => 'rater#create', :as => 'rate'
  get 'admin' => "dashboard#index"
  get 'user_dashboard'  => "user_dashboard#index", as: 'user_profile'
  get 'update_profile'  => "user_dashboard#edit", as: 'update_profile'
 
  get '/listings' => "home#listings" , as:'listings'
  get '/listing' => "home#listing" , as:'listing'
  delete '/delpic' => "rooms#delpic"
  delete '/delroompic' => "admin_rooms#delpic"
  delete '/delprofilepic' => "profiles#delprofilepic", as: 'delete_profile_pic'
  post '/profilepic_upload' => "profiles#uploadprofilepic"
end
