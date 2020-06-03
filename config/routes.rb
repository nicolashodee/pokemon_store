Rails.application.routes.draw do
  root 'items#index'
  resources :items
  resources :carts
  devise_for :users
  namespace :admin do
    resources :items
  end
  resources :users
  get 'home/private'
  resources :orders
  resources :charges, only: [:new, :create]
end
