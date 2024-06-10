require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :websites, only: [:create, :index]
      resources :screenshots, only: [:index]
      resource :settings, only: [:update]
    end
  end

  mount Sidekiq::Web => '/sidekiq'
end
