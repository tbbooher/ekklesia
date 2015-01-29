Rails.application.routes.draw do
  root 'welcome#index'
  get '/about', to: 'welcome#about'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'
  get '/signup', to: 'users#new'

  resources :legislators, only: [:index, :show]

  post '/upvotes/create', to: 'upvotes#create'

  get '/stances/load', to: 'stances#load'
  resources :stances do
    get '/donations', to: 'donations#show'
    get '/donations/new', to: 'donations#new'
    post '/donations', to: 'donations#create'
  end

  get '/search', to: 'stances#search'
  get '/stances/issues/:select', to: 'stances#select'

  get '/issues/positions', to: 'stances#positions_by_issue'

  resources :issues
  resources :users
end
