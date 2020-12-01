Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets
  resources :users, only: :show do
    member do
      get 'task'
    end
  end
end
