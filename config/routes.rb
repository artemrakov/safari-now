Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  post 'create_booking/:safari_id/:id', to: 'pages#create_booking', as: 'create_booking'

  resources :safaris
  resources :users, only: [:show, :edit, :update, :destroy]
end
