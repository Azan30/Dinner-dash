# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :categories do
    resources :items, only: [:index]
  end

  resources :items

  resources :orders

  resources :cart, only: [:show] do
    member do
      get 'add'
      get 'remove'
      put 'quantity'
    end
  end

  root to: 'welcome#index'
end
