# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  resources :messages
  resources :send_loggers

  get 'sender/index'
  post 'sender/create'
  delete 'sender/delete'

  mount Sidekiq::Web => '/sidekiq'

  root 'sender#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
