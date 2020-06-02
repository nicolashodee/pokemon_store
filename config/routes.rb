Rails.application.routes.draw do
  resources :carts, only: [:show, :edit, :update]
  resources :items
  root 'items#index'
end
