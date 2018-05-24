Rails.application.routes.draw do
  root to: 'home#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  resources :users do
    resources :routes, only: [:index]
    resources :companies, only: [:index, :show]
    resources :points, only: [:index]
  end
end
