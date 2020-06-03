Rails.application.routes.draw do
  get 'avatars/create'
  root 'items#index'
  resources :items
  resources :carts, only: [:show, :edit, :update]
  devise_for :users
  resources :users
  namespace :admin do
    resources :items
  end
  get 'home/private'
  resources :orders
  resources :charges, only: [:new, :create]
end
