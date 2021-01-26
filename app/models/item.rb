class Item < ApplicationRecord
  # item.imageで、添付されたファイルにアクセスできるようになる
  has_one_attached :image
end
