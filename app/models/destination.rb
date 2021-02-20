class Destination < ApplicationRecord
  # アソシエーション
  belongs_to :history

  # ActiveHashを用いてのbelongs_toの設定
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
