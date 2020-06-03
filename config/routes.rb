Rails.application.routes.draw do
  root 'items#index'
  resources :items
  resources :carts, only: [:show, :edit, :update]
  devise_for :users
  namespace :admin do
    resources :items
  end
  get 'home/private'
<<<<<<< HEAD
  resources :orders
  
=======
  resources :charges, only: [:new, :create]
>>>>>>> 8d3836412af2bb7042092c0a5362e71e8d4ec484
end
