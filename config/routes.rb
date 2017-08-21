Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'search', to: 'pages#search'

  resources :safaris
  resources :users, only: [:show, :edit, :update, :destroy]
end
