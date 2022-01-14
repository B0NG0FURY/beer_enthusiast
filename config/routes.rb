Rails.application.routes.draw do
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end
  resources :styles
  get '/', to: 'welcome#index'
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/google_oauth2/callback', to: 'sessions#create_with_omniauth'
  get '/logout', to: 'sessions#delete'
  get '/signup', to: 'users#new'
  resources :reviews, only: [:create, :update, :destroy]
  get '/beers/top10', to: 'beers#top10'
  get '/beers/strongest', to: 'beers#strongest'
  get '/beers/search', to: 'beers#search'
  resources :beers, only: [:index, :show, :new, :create] do
    concerns :paginatable
    resources :reviews, only: [:index, :new, :edit], concerns: :paginatable
  end
  resources :breweries, only: [:index, :show], concerns: :paginatable
  resources :users, only: [:show, :create] do
    get '/beers/top10', to: 'beers#top10'
    get '/beers/strongest', to: 'beers#strongest'
    resources :beers, only: [:index, :show]
    resources :reviews, only: [:index, :edit]
    resources :breweries, only: [:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
