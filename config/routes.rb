Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "places#index"
  resources :places
  resources :users, only:[:index,:show,:create,:new]

end
