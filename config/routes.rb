Rails.application.routes.draw do
  
  resources :rooms
  get 'admin' => "dashboard#index"

  devise_for :users
  root 'home#index'

  delete '/delpic' => "rooms#delpic"
end
