Rails.application.routes.draw do
  # ルートパスへアクセスすると、items/index.html.erbが表示される
  root to: "items#index"

end
