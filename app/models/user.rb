class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX
         validates :nickname, presence: true
        #  validates :email, uniqueness: true
         validates :birth_date, presence: true
         validates :encrypted_password, presence: true
         with_options presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/} do
           validates :last_name
           validates :first_name
         end
         with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/} do
           validates :last_name_kana
           validates :first_name_kana
         end

end

