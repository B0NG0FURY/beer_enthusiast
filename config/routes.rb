Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  post '/signup', to:'users#create'
  resources :reviews
  resources :beers
  resources :breweries
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
