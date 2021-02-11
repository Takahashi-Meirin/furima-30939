class Destination < ApplicationRecord
    # アソシエーション
    belongs_to :history
    belongs_to :order
  
    # ActiveHashを用いてのbelongs_toの設定
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture
  
    # 空の場合はDBに保存しない
    with_options presence: true do
      validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
      validates :municipality
      validates :address
      validates :phone_number, format: { with: /\A0[0-9]+\z/ }
      validates :token
    end
  
    # 選択が「---」の時は保存できないようにする
      validates :prefecture_id, numericality: { other_than: 1 }
  
end