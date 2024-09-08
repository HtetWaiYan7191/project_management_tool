# frozen_string_literal: true

Rails.application.routes.draw do
  resources :events do 
    collection do 
      get '/:date/filter_by_date', to: 'events#filter_by_date'
    end
  end
  resources :users, only: %i[index]
  resources :boards do
    member do
      put '/lists/:list_id/reorder_list', to: 'boards#reorder_lists', as: :reorder_lists
    end
    resources :lists do
    end
  end

  resources :lists do
    member do
      put '/cards/:card_id/reorder_cards', to: 'lists#reorder_cards', as: :reorder_cards
    end
    resources :cards
  end
  # resources :to_dos do
  #   resources :to_do_lists do
  #     get 'edit', to: 'to_do_lists#edit', defaults: { format: :turbo_stream }, on: :member
  #   end
  # end

  resources :to_dos do
    member do
      patch :update_status, to: 'to_dos#update_status'
    end
    resources :to_do_lists do
      member do
        get :hide_edit, to: 'to_do_lists#hide_edit'
        patch :update_status, to: 'to_do_lists#update_status'
      end
    end
  end

  get 'profile/edit'
  patch 'profile/update'

  resources :annoucements do
    resources :comments
  end

  resources :doc_and_files do
    resources :comments
  end

  resources :departments
  resources :messages
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
