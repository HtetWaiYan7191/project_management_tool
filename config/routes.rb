# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'pages#welcome'
  get 'pages/landing', to: 'pages#landing'
end
