Rails.application.routes.draw do
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/secret', to: 'static_pages#secret'
  root 'static_pages#index'
end
