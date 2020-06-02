Rails.application.routes.draw do
  root 'items#index'
  resources :items
  resources :carts, only: [:show, :edit, :update]
  devise_for :users
  get 'home/private'
  
end
