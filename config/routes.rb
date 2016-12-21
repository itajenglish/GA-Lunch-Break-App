Rails.application.routes.draw do

  root to: "home#index"
  resources :places
  resources :users, only:[:index,:show,:create,:new]
  resources :comments

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end
