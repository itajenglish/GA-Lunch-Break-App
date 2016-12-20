Rails.application.routes.draw do
  get 'sessions/login'
  post 'sessions/login_attempt'

  get 'sessions/home'

  get 'sessions/profile'

  get 'sessions/setting'

  match 'signup', to: 'users#new' , :via => [:get, :post]
  match 'login', to: 'sessions#login_attempt', :via => [:get, :post]
  # post 'sessions/login', to: 'sessions#login'
  match 'logout', to: 'sessions#logout', :via => [:get, :post]
  match 'home', to: 'sessions#home', :via => [:get, :post]
  match 'profile', to: 'sessions#profile', :via => [:get, :post]
  match 'setting', to: 'sessions#setting', :via => [:get, :post]

  root to: 'places#index'
  root to: 'sessions#login'

  resources :places
  resources :users, only: [:index, :show, :create, :new]
  resources :comments
end
