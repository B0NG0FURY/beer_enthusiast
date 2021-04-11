Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#delete'
  get '/signup', to: 'users#new'
  resources :reviews, only: [:create, :update]
  resources :beers do
    resources :reviews, only: [:index, :new, :edit]
  end
  resources :breweries
  resources :users, only: [:show, :create] do
    resources :beers, only: [:index, :show]
    resources :reviews, only: [:index, :edit]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
