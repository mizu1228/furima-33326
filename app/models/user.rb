class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name, :email, :encrypted_password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_day 
    validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'には全角文字を使用してください' }
    validates :first_name_kana, :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'には全角カタカナを使用してください' }

  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には記号以外、半角英数字の両方を含めて設定してください'

  has_many :items
  has_many :orders
end

