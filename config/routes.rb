Rails.application.routes.draw do
  default_url_options :host => Rails.application.secrets.domain_name
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'jobs#index'

  devise_for :users

  resources :jobs, only: [:index, :new, :create]

  resources :companies do
    resources :jobs, except: [:new, :create] do
      member do
        get 'review'
        get 'approve/:token', to: 'jobs#approve', as: 'approve_job'
        get 'reprove/:token', to: 'jobs#reprove', as: 'reprove_job'
      end
    end
  end
end
