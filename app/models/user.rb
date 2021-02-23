class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name, :email, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_day 
    validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'には全角文字を使用してください' }
    validates :first_name_kana, :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'には全角カタカナを使用してください' }
  end

  # PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  # validates_format_of :password, with: PASSWORD_REGEX, message: 'には記号以外、半角英数字の両方を含めて設定してください'

  def update_without_current_password(params, *options)
    params.delete(:password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  def soft_delete  
    update_attribute(:deleted_at, Time.current)  
  end

  def active_for_authentication?  
    super && !deleted_at  
  end 

  def inactive_message
    !deleted_at ? super : :delete_account
  end

  has_many :likes, dependent: :destroy
  has_many :like_items, through: :likes, source: :post
  has_many :items
  has_many :orders
  has_many :comments
  has_one_attached :image
  # has_one :address

  def liked_by?(item_id)
    likes.where(item_id: item_id).exists?
  end

end

