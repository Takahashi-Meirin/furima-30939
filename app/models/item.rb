class Item < ApplicationRecord
  # item.imageで、添付されたファイルにアクセスできるようになる
  has_one_attached :image

  # アソシエーション
  belongs_to :user
  has_one :history

  # ActiveHashを用いてのbelongs_toの設定
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_cost
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_day


  # 空の場合はDBに保存しない
  with_options presence: true do
    validates :name
    validates :introduction
    validates :price, format: {with: \\\d{1,3}(,\d{3})*\b[300-9999999] }
  end

  # 選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_day_id
  end

end
