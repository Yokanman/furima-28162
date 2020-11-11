class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, inclusion: { in: ["@"], message: "is invalid. email needs to include @."}
  validates :password, presence: true,
                       length: { minimum: 6, message: "is invalid Input more than 6 charactors." } 
                       format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "is invalid Input both half-width characters and numbers"}

end
