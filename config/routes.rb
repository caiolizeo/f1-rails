Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  resources :calendar, only: [:index]
  resources :circuit, only: [:show]

  resources :standings, only: [:index]


end
