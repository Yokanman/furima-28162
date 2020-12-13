class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    validates :email, format: { with: VALID_EMAIL_REGEX }
    validates :password,
              length: { minimum: 6, message: 'is invalid Input more than 6 charactors.' },
              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid Input both half-width characters and numbers' }
    VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
    validates :first_name,
              format: { with: VALID_NAME_REGEX, message: '全角文字で入力してください' }
    validates :family_name,
              format: { with: VALID_NAME_REGEX, message: '全角文字で入力してください' }
    VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    validates :first_name_kana,
              format: { with: VALID_NAME_KANA_REGEX, message: '全角カタカナで入力してください' }
    validates :family_name_kana,
              format: { with: VALID_NAME_KANA_REGEX, message: '全角カタカナで入力してください' }
    validates :birth_day
  end
end
