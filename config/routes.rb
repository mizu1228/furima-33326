Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users

  resources :items, except: :index do
    resources :orders, only: [:index, :create]
  end
  resources :dummy_item, only: :index
  resources :users, only: [:show]
end
