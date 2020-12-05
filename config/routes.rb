Rails.application.routes.draw do

  # ルート先の設定
  root to: 'tweets#index'

  # ユーザー機能に関するルーティング
  resources :users, only: :show do
    get :fovorites, on: :collection
    member do
      get :task, :following, :followers
    end
  end

  # 投稿機能に関するルーティング
  resources :tweets do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: :create
  end

  # ログイン機能に関するルーティング
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # フォロー機能に関するルーティング
  resources :relationships, only: [:create, :destroy]
  
end
