Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :searches
  resources :items, only: [:create, :update, :destroy]
  resources :orders do
    member do
      patch :accepted
      patch :refused
    end
  end

  resources :event_participants, only: [:create, :destroy]
  resources :stores do
    resources :events, only: [:new, :create]
    resources :orders, only: [:create]
    resources :products, only: [:new, :create, :show, :edit, :update]
  end

  resources :events, except: [:new, :create]

  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
end
