Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#delete'
  get '/signup', to: 'users#new'
  resources :reviews
  resources :beers
  resources :breweries
  resources :users, only: [:show, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
