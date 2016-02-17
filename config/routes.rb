Rails.application.routes.draw do
  
  resources :rooms
  get 'admin' => "dashboard#index"

  devise_for :users
  root 'home#index'


end
