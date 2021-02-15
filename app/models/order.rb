class Order 
  # ActiveModel::Modelを呼び出し
  include ActiveModel::Model

  # 保存したい複数のテーブルのカラム名を全て扱えるようにする,トークンの値を取り扱えるようにする
  attr_accessor :post_code, :municipality, :address, :building, :phone_number, :perfecture_id, :history_id, :user_id, :item_id, :token

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

  #データを各テーブルに保存する処理 
  def save
    Destination.create(post_code: post_code, municipality: municipality, address: address, building: building, phone_number: phone_number, perfecture_id: perfecture_id)
    Histories.create(user_id: user_id, item_id: item_id)
  end
end