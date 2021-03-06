# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_out', to: 'users/sessions#destroy'
  end

  root 'static_pages#index'

  resources :events do
    resources :participants, only: %i[index create destroy]
    collection do
      get 'search'
    end
  end

  resources :users, only: :show do
    resources :hosts, only: :index
    resources :guests, only: :index
    resources :messages, only: %i[index create]
  end
end
