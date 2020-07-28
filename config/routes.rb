Rails.application.routes.draw do

  root 'users#index'

  resources :favorites
  resources :users
  resources :locations
  resources :pets

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

end
