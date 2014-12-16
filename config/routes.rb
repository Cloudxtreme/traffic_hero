Rails.application.routes.draw do
  get 'users/new'

  root 'static_pages#home'
  match '/help',      to: 'static_pages#help',      via: 'get'
end
