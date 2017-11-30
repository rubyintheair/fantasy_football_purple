Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :matches 
  resources :game_items
  resources :team_plays

  root "home#index"
end
