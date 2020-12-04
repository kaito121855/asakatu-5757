Rails.application.routes.draw do
  root to: 'tweets#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :tweets do
    resources :comments, only: :create
  end
  resources :users, only: :show do
    member do
      get :task, :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
