Rails.application.routes.draw do
  get 'users/index'
  post 'users/index' => 'users#create'
  # get 'users/profile'
  get 'users/account'
#   devise_for :users
  get 'reservations/index'
  get 'users/profile'
  post 'users/profile'
  get 'users/show'
  get 'users/account'
  
  resources :reservations
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
end
