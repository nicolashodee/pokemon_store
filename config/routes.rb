Rails.application.routes.draw do
  root 'items#index'
  resources :items
  resources :carts, only: [:show, :edit, :update]
  devise_for :users
  namespace :admin do
    resources :items
  end
  get 'home/private'
  resources :charges, only: [:new, :create]
end
