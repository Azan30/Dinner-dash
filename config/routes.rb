# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories do
    resources :items, only: [:index]
    # get 'items', on: :member
  end

  resources :items

  resources :orders

  resources :cart, only: [:show] do
    get 'add', on: :member
    get 'remove', on: :member
  end
end
