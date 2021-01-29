class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :email, :encrypted_password, :first_name,
            :last_name, :first_name_kana, :last_name_kana, :birth_day, presence: true
end
