Rails.application.routes.draw do
  resources :standings
  resources :team_games
  resources :teams
  resources :players
  resources :comments
  resources :games
  resources :users
  post '/login', to: 'auth#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
