Rails.application.routes.draw do
  resources :favorites
  resources :users
  resources :locations
  resources :pets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
