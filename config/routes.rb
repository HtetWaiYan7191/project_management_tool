# frozen_string_literal: true

Rails.application.routes.draw do
  resources :annoucements
  resources :departments
  resources :companies
  devise_for :users, {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
  

  # Define authenticated and unauthenticated root paths
  authenticated :user do
    root 'pages#home', as: :authenticated_root
  end

  unauthenticated do
    root 'pages#welcome', as: :unauthenticated_root
  end
    
  # Defines the root path route ("/")
  get 'pages/landing', to: 'pages#landing'
end
