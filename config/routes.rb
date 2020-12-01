Rails.application.routes.draw do
  root 'courses#index'

  resources :users
  resources :courses
end
