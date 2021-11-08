Rails.application.routes.draw do
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
  resources :beers, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:index, :new, :edit]
  end
  resources :breweries, only: [:index, :show]
  resources :users, only: [:show, :create] do
    get '/beers/top10', to: 'beers#top10'
    get '/beers/strongest', to: 'beers#strongest'
    resources :beers, only: [:index, :show]
    resources :reviews, only: [:index, :edit]
    resources :breweries, only: [:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
