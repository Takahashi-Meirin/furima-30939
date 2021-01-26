class Item < ApplicationRecord
  # item.imageで、添付されたファイルにアクセスできるようになる
  has_one_attached :image
  # ActiveHashを用いてのbelongs_toの設定
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  # 空の場合はDBに保存しない
  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
  end

  # カテゴリーの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }
  
end
