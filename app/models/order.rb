class Order < ApplicationRecord
  # トークンの値を取り扱えるとうにする
  # attr.accessor :token
  # 空の場合はDBに保存しない
  # validates :price, presence: true
  # validates :token, presence: true
end
