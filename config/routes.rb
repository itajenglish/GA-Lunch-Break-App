Rails.application.routes.draw do
  get 'sessions/login'

  get 'sessions/home'

  get 'sessions/profile'

  get 'sessions/setting'

  match 'signup', to: 'users#new' , :via => [:get, :post]
  # match 'login', to: 'sessions#login', :via => [:get, :post]
  post 'sessions/login', to: 'sessions#login'
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
