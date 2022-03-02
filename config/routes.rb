Rails.application.routes.draw do
  root to: 'home#index'

  resources :circuits, only: [:index, :show]
  resources :standings, only: [:index]
  resources :drivers, only: [:show]

end
