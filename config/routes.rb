Rails.application.routes.draw do
  get 'users/index'
  patch 'users/index' => 'users#update'
  post 'users/index' => 'users#create'
  
  post 'rooms/new' => 'rooms#create'
  
  post 'rooms/index' => 'rooms#create'
  # get 'rooms/index'
  get 'rooms/posts'
  
  get 'users/account'
  get 'reservations/index'
  get 'reservations/catalog'
  get 'users/profile'
  post 'users/profile'
  get 'users/show'
  get 'users/account'
  get 'rooms/reservations'
  post 'reservations/:id' => 'reservations#show'
  get 'rooms/search' 
  
  resources :reservations
  # resources :users
  resources :posts
  resources :rooms
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  
  resources :rooms do
    collection do
      get 'posts'
      get 'reservations'
    end
  end
  
  resources :users do
    resources :rooms ,module:'users'
  end
  
end