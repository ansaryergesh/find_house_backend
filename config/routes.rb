# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/favouriteValues', to: 'favourites#favouriteValues'
      resources :homes
      # resources :users do
      #   resources :homes
      # end
      get '/myHouse', to: 'homes#userhouse'
      resources :favourites
    end
  end
end
