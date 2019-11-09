Rails.application.routes.draw do
  root to: 'events#index'
  resources :events, only: %i[index show]

  namespace :admin do
    resources :events
    resources :about
    resources :contacts
  end

  resources :about, only: :index
  resources :contacts, only: :index
  devise_for :users
end
