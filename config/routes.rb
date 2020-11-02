# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :categories do
    resources :items, only: [:index]
  end

  resources :items

  resources :orders, except: %i[new create]

  resources :cart, only: [:show] do
    member do
      get 'add'
      get 'remove'
      put 'quantity'
    end
    resource :orders, only: [:new]
  end

  namespace :api do
    namespace :v1 do
      resources :items
      resources :categories
    end
  end

  root to: 'welcome#index'
end
