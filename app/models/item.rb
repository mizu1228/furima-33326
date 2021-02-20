class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :when_post
  belongs_to :item_status
  belongs_to :shipping

  belongs_to :user
  has_one    :order
  has_one_attached :image
  has_many :comments
  has_many :item_brands
  has_many :brands, through: :item_brands

  with_options presence: true do
    validates :image
    validates :item, length: { maximum: 40}
    validates :explanation, length: { maximum: 1000 }
    validates :prefecture_id, :category_id, :when_post_id, :shipping_id, :item_status_id, numericality: { other_than: 0, message: "は選択必須です" }
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "は半角数字300~9999999の間で入力してください" }
  end

end
