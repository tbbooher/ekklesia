Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'
  get '/signup', to: 'users#new'
  get '/quiz/', to: 'users#quiz'
  post '/process_form', to: 'users#process_form'

  resources :votes
  # post '/vote', to: 'welcome#create'

  resources :legislators, only: [:index, :show]

  post '/upvotes/create', to: 'upvotes#create'

  get '/stances/load', to: 'stances#load'
  resources :stances do
    get '/donations/new', to: 'donations#new'
    post '/donations', to: 'donations#create'
    post '/donations/donationemail', to: 'donations#email'
  end

  resources :donations, only: [:show]

  get '/search', to: 'stances#search'
  get '/stances/issues/:select', to: 'stances#select'
  get '/about', to: 'welcome#about'

  get '/issues/positions', to: 'stances#positions_by_issue'

  resources :issues
  resources :users
end
