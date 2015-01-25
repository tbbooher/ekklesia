Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'
  get '/signup', to: 'users#new'
  get '/legislators/:id', to: 'legislators#show'
  post '/upvotes/create', to: 'upvotes#create'

  get '/search', to: 'stances#search'
  get 'stances/:select', to: 'stances#select'
  get 'stances/:sort', to: 'stances#sort'

  resources :users
  resources :stances
end
