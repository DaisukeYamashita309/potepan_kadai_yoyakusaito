Rails.application.routes.draw do
  get 'users/index'
  patch 'users/index/;id' => 'users#update'
  post 'users/index/:id' => 'users#create'
  
  post 'rooms/new' => 'rooms#create'
  get 'rooms/new'
  
  post 'rooms/index' => 'rooms#create'
  get 'rooms/index'
  get 'rooms/posts'
  
  # patch 'rooms/index' => 'rooms#create'
  # post 'rooms/index' => 'rooms#create'
  
  # get 'users/profile'
  get 'users/account'
#   devise_for :users
  get 'reservations/index'
  get 'users/profile'
  post 'users/profile'
  get 'users/show'
  get 'users/account'
  get 'rooms/reservations'
  
  resources :reservations
  # resources :users
  resources :posts
  resources :rooms
    # get 'users/sign_in', to: 'users/registrations#new'
    # get 'users/sign_up', to: 'users/registrations#new'
  
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
    # member do
    #   get 'posts'
    #   # get 'reservations'
    # end
  end
  resources :users do
    resources :rooms ,module:'users'
      # get 'rooms'
  end
end