Rails.application.routes.draw do
  
  # ユーザー機能に必要な複数のルーティングを１度に生成してくれる
  devise_for :users

  # ルートパスへアクセスすると、items/index.html.erbが表示される
  root to: "items#index"

  # ユーザー編集に必要なルーティング
  resources :users, only: [:edit, :update]

end
