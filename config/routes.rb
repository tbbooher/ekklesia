Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'
  get '/signup', to: 'users#new'
  get '/legislators/:id', to: 'legislators#show'
  post '/upvotes/create', to: 'upvotes#create'

  get '/search', to: 'stances#search'
  resources :stances do
    get '/donations', to: 'donations#show'
    post '/donations/create', to: 'donations#create'
  end
  get '/stances/:select', to: 'stances#select'
  get '/stances/:id/donation', to: 'stances#donation'

  resources :users
end
