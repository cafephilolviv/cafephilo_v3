Rails.application.routes.draw do
  resources :events, only: %i[index show]

  namespace :admin do
    resources :dashboard, only: %i[index]
    resources :events
    resources :about
    resources :contacts
  end

  resources :about, only: :index
  resources :contacts, only: :index
  devise_for :users
end
