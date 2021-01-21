class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # 空の場合はDBに保存しない
  validates :nickname,         presence: true
  validates :family_name,      presence: true
  validates :first_name,       presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana,  presence: true
  validates :birth_day,        presence: true

  has_many :items
  has_many :histories

end
