Rails.application.routes.draw do

  root 'users#new'

  get 'directions/index'
  get 'directions/show'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :traffic

  match '/signup',    to: 'users#new',              via: 'get'
  match '/signin',    to: 'sessions#new',           via: 'get'
  delete '/logout', to: 'sessions#destroy',         as: 'signout'

  match '/help',      to: 'static_pages#help',      via: 'get'
  match '/about',     to: 'static_pages#about',     via: 'get'
  match '/contact',   to: 'static_pages#contact',   via: 'get'
  
  match '/maps/show',  to: 'maps#show',              via: 'get'

  # match '/traffic/index', to: 'traffic#index',        via: 'get'  
end
