Rails.application.routes.draw do

  root to: "places#index"
  resources :places
  resources :users, only:[:index,:show,:create,:new]
  resources :comments
end
