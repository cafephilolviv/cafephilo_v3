# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/admin', to: 'admin/dashboard#index', as: 'admin_root'

  root to: 'events#index'

  resources :events, only: %i[index show]
  resources :about, only: :index
  resources :contacts, only: :index
  resources :email_subscriptions, only: %i[create show destroy], param: :uuid

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end
end
