Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :circuits, only: [:index, :show]
  resources :standings, only: [:index]
  resources :drivers, only: [:show]

  resources :bets, only: [:index, :new, :create, :show]

end
