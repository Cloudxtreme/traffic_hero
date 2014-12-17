Rails.application.routes.draw do

  root 'users#new'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  match '/signup',    to: 'users#new',              via: 'get'
  match '/signin',    to: 'sessions#new',           via: 'get'
  delete '/logout', to: 'sessions#destroy', as: 'signout'

  match '/help',      to: 'static_pages#help',      via: 'get'
  match '/about',     to: 'static_pages#about',     via: 'get'
  match '/contact',   to: 'static_pages#contact',   via: 'get'

  get 'maps/index'
  get 'maps/show'

  
end
