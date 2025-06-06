Rails.application.routes.draw do
  get 'users/show'

  resources :chats do
  post :generate_ad_from_image, on: :member
  resources :messages, only: [:create]
  end

  get 'teams/index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  root to: "pages#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :users, only: [:show]
  resources :jerseys, only: [:index, :new, :create, :show]
  resources :chats, only: [:create, :show] do
    resources :messages, only: [:new, :create, :show]
  end
  resources :teams
end
