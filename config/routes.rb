require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'events#index'

  resources :events, only: %i[index show]
  resources :about, only: :index
  resources :contacts, only: :index
  resources :email_subscriptions, only: %i[create show destroy], param: :uuid

  get '/admin', to: 'admin/dashboard#index', as: 'admin_root'

  authenticate :user do
    namespace :admin do
      resources :dashboard, only: %i[index]
      resources :events
      resources :members, only: %i[index edit update]
      resources :facts
      resources :about
      resources :contacts
    end
  end
  devise_for :users

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end
end
