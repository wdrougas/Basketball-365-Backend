Rails.application.routes.draw do
  resources :team_games
  resources :teams
  resources :players
  resources :comments
  resources :games
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end