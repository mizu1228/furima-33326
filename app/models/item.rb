class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :item, :explanation, presence: true
  validates :prefecture_id, :category_id, :when_post_id, :shipping_id, :item_status_id, numericality: { other_than: 0 }
  validates :price, presence: true, numericality: {only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "は300~9999999の間で入力してください" }
  

belongs_to :user
belongs_to :prefecture, :category, :when_post, :item_status, :shipping
has_one_attached :image

end
