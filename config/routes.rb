Rails.application.routes.draw do
  
  # ユーザー機能に必要な複数のルーティングを１度に生成してくれる
  devise_for :users

  # ルートパスへアクセスすると、items/index.html.erbが表示される
  root to: "items#index"

  # itemsコントローラーで使用するアクションの定義
  resources :items do
    resources :orders, only: [:index, :create]
  end

  
end
