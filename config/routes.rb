Rails.application.routes.draw do

  root 'users#index'

  resources :favorites
  resources :users
  resources :locations
  resources :pets

end
