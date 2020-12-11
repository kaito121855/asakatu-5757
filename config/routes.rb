Rails.application.routes.draw do

  # ルート先の設定
  root to: 'users#home'

  # ログイン機能に関するルーティング
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # ユーザー機能に関するルーティング
  resources :users, only: :show do
    member do
      get :home, :task, :record, :following, :followers
    end
  end

  # 投稿機能に関するルーティング
  resources :tweets do
    resource :favorites, only: [:create, :destroy]
    resource :achievements, only: [:create, :destroy]
    resources :comments, only: :create
  end

  # フォロー機能に関するルーティング
  resources :relationships, only: [:create, :destroy]
  
end
