class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          with_options presence: true do
          validates :nickname
          validates :birth_day
          validates :email,    uniqueness: {case_sensitive: false},
                               format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
          validates :password, length: {minimum: 6}
          end
       
          with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} do
            validates :family_name, presence: true
            validates :first_name, presence: true
          end
       
          with_options format: {with: /\A[ァ-ヶー－]+\z/} do
            validates :family_kana, presence: true
            validates :first_kana, presence: true
          end        
end