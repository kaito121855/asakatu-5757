Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets do
    resources :comments, only: :create
  end
  resources :users, only: :show do
    member do
      get 'task'
    end
  end
  resources :relationships, only: [:create, :destroy]
end
