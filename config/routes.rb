# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users
  resources :users
  resources :groups, only: [:index, :show, :new, :create] do
    resources :entities, only: [:new, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "splash#index"
end
