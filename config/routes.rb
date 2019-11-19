Rails.application.routes.draw do
  root to: 'events#index'

  resources :events, only: %i[index show]
  resources :about, only: :index
  resources :contacts, only: :index

  get '/admin', to: 'admin/dashboard#index', as: 'admin_root'

  namespace :admin do
    resources :dashboard, only: %i[index]
    resources :events
    resources :about, only: %i[index]
    resources :members, only: %i[edit update]
    resources :facts, only: %i[edit update]
    resources :about, only: %i[index]
    resources :contacts
  end

  devise_for :users
end
