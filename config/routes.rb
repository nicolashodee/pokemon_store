Rails.application.routes.draw do
  get 'avatars/create'
  root 'items#index'
  resources :items, :path => "mon_pokemon"
  resources :carts, :path => "mon_panier"
  devise_for :users
  namespace :admin do
    resources :items
  end
  resources :users, :path => "mon_profil"
  get 'home/private'
  resources :orders, :path => "ma_commande"
  resources :charges, only: [:new, :create], :path => "mon_paiement"

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

end
