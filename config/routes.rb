Rails.application.routes.draw do
  resources :events

  devise_for :users
end
