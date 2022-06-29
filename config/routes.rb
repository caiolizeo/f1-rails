Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  resources :calendar, only: [:index]
  resources :circuits, only: [:show]
  resources :standings, only: [:index]
  resources :drivers, only: [:show]
  resources :profile, only: [:index]
  resources :bets, only: [:index, :new, :create, :show]
  resources :rankings, only: [:index] do
    get 'last_race', on: :collection
    get 'season', on: :collection
  end

end
