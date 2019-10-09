Rails.application.routes.draw do
  get 'events/index'

  devise_for :users
end
