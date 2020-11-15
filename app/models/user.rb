class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true,
                       length: { minimum: 6, message: 'is invalid Input more than 6 charactors.' },
                       format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid Input both half-width characters and numbers' }
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字で入力してください' }
  validates :family_name, presence: true,
                          format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字で入力してください' }
  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力してください' }
  validates :family_name_kana, presence: true,
                               format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力してください' }
  validates :birth_day, presence: true
end
