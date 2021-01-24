class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # 空の場合はDBに保存しない
  with_options presence: true do
    validates :nickname
    validates :birth_day
    validates :password, format: {with: /\A[a-z\d]{6,100}+\z/i }
    
    with_options format: {with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :family_name
      validates :first_name
    end

    with_options format: {with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/} do
      validates :family_name_kana
      validates :first_name_kana
    end
  end

  has_many :items
  has_many :histories

end
