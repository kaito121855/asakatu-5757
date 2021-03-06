Rails.application.routes.draw do

  # ルート先の設定
  root to: 'users#home'

  # ログイン機能に関するルーティング
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # ゲストログインに関するルーティング
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end

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

  # カテゴリー検索機能に関するルーティング
  resources :categories, only: [:index] do
    collection do
      get :training, :walking, :study, :health, :housework, :search
    end
  end

end
