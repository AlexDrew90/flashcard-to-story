Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Stories resource routes
  resources :stories, only: [:new, :create, :show, :index] do
    post 'save', on: :collection
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
