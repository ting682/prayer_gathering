Rails.application.routes.draw do
  
  # resources :prayers
  # resources :gatherings
  
  get '/gatherings/active_gatherings', to: "gatherings#active", as: "active_gatherings"

  resources :gatherings do
    resources :prayers, only: [:index, :show, :new, :edit]
  end

  resources :prayers

  root 'users#home'

  get '/signup', to: "users#new"

  post '/signup', to: "users#create"

  get '/login', to: "sessions#new"

  post '/login', to: "sessions#create"

  get '/logout', to: "sessions#destroy", as: "logout"

  get '/auth/facebook/callback' => 'sessions#create'

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
