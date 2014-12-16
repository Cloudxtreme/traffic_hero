Rails.application.routes.draw do
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root 'static_pages#home'
  match '/help',      to: 'static_pages#help',      via: 'get'
  match '/signup',    to: 'users#new',              via: 'get'
end
