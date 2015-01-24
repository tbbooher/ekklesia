Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'
  get '/signup', to: 'users#new'
  get '/legislators/:id', to: 'legislators#show'
  get '/search', to: 'stances#search'
  post '/upvotes/create', to: 'upvotes#create'

  resources :users
  resources :stances
end
