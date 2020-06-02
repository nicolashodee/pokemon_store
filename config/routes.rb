Rails.application.routes.draw do
<<<<<<< HEAD
  root 'items#index'
  resources :items
  resources :carts, only: [:show, :edit, :update]
=======
  root 'home#index'
  
>>>>>>> action_mailer_nico
  devise_for :users
  get 'home/private'
end
