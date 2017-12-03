Rails.application.routes.draw do
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#  resources :sessions, only: [:new, :create, :destroy]
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"

  resources :users
  resources :matches 
  resources :game_items
  resources :team_plays

  root "home#index"
end
