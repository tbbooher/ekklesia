Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'
  get '/signup', to: 'users#new'
  get '/quiz', to: 'users#quiz'
  post '/process_form', to: 'users#process_form'

  resources :votes
  resources :users
end
