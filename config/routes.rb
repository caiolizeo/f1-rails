Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  resources :calendar, only: [:index]
  resources :circuits, only: [:show]
  resources :standings, only: [:index]
  resources :drivers, only: [:show]
  resources :profile, only: [:index]
  resources :bets, only: [:index, :new, :create, :show]

end
