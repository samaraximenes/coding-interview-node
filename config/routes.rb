Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies do
    resources :users, only: [:index]
  end

  resources :tweets, only: [:index] do
    collection do
      get :report # GET /tweets/report
    end
  end

  resources :users, only: [:index, :show] do
    resources :tweets, only: [:index]
  end
end
