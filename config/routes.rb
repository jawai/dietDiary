require 'sidekiq/web'

Rails.application.routes.draw do
  resources :meals
  get '/month', to: 'meals#month'

  namespace :admin do
    resources :users
    resources :announcements
    resources :notifications
    resources :services

    root to: "users#index"
  end

  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  authenticated :user do #for users signed in, this is the root route
    root 'meals#index', as: :authenticated_root
  end

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
