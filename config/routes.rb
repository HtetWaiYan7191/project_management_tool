# frozen_string_literal: true

Rails.application.routes.draw do
  get 'profile/edit'
  patch 'profile/update'

  resources :annoucements do
    resources :comments
  end

  resources :doc_and_files do
    resources :comments
  end

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
