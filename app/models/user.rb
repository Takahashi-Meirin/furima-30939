class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # 空の場合はDBに保存しない
  validates :nickname,         presence: true
  validates :family_name,      presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name,       presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name_kana, presence: true, format: {with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/}
  validates :first_name_kana,  presence: true, format: {with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/}
  validates :birth_day,        presence: true

  has_many :items
  has_many :histories

end
