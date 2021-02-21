Rails.application.routes.draw do
  root to: 'items#index'
  get '/user_delete' => 'users#user_delete'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :items, except: :index do
    resources :orders, only: [:index, :create]
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end
  resources :dummy_item, only: :index
  resources :users, only: [:show]
end
