Rails.application.routes.draw do
  root to: 'items#index'
  get '/user_delete' => 'users#user_delete'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # devise_scope :user do
  #   get 'address', to: 'users/registrations#new_address'
  #   post 'address', to: 'users/registrations#create_address'
  # end

  resources :items, except: :index do
    post 'like/:id' => 'likes#create', as: 'create_like'
    delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
    resources :orders, only: [:index, :create]
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end
  resources :dummy_item, only: :index
  resources :users, only: [:show]
end
