class Item < ApplicationRecord
  # item.imageで、添付されたファイルにアクセスできるようになる
  has_one_attached :image

  # ActiveHashを用いてのbelongs_toの設定
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture


  # 空の場合はDBに保存しない
  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
  end

  # 選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_cost_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }


end
