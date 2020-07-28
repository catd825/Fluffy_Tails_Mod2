Rails.application.routes.draw do

  root 'users#index'

  resources :favorites
  resources :users
  resources :locations
  resources :pets

  get '/sessions/new', to: 'sessions#new', as: 'new_session'
  post '/sessions', to: 'sessions#login', as: 'login'
  delete '/sessions/logout', to: 'sessions#logout', as: 'logout'

end
