Rails.application.routes.draw do

  root 'users#index'

  resources :favorites
  resources :users
  resources :locations
  resources :pets

  # get “/login”, to: 'sessions#new'
  # post “/login”, to: 'sessions#create'

end
