Rails.application.routes.draw do
  default_url_options :host => Rails.application.secrets.domain_name
  require 'sidekiq/web'

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'jobs#index'

  devise_for :users

  get '/feed', to: 'jobs#feed'

  resources :companies

  resources :jobs do
    member do
      get 'review'
      get 'approve/:token', to: 'jobs#approve', as: 'approve'
      get 'reprove/:token', to: 'jobs#reprove', as: 'reprove'
      get 'remove/:token', to: 'jobs#remove', as: 'remove'
    end
  end

  namespace :dashboard do
    root to: 'dashboard#index'

    resources :companies
  end
end
