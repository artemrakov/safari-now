Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :safaris
  resources :users, only: [:show, :edit, :update, :destroy]
end
