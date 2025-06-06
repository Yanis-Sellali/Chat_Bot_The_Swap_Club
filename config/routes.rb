Rails.application.routes.draw do
  get 'users/show'

  resources :chats, only: [:create, :show] do
    post :generate_ad_from_image, on: :member
    post :confirm_ad, on: :member

    resources :messages, only: [:new, :create, :show]

    post "jerseys/auto_create", to: "jerseys#auto_create", as: :auto_create_jersey
  end

  get 'teams/index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: "pages#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: [:show]
  resources :jerseys, only: [:index, :new, :create, :show]
  resources :teams
end
