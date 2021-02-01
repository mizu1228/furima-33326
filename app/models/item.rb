class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :item, :explanation, :price , presence: true
  validates :prefecture_id, :category_id, :when_post_id, :shipping_id, :item_status_id numericality: { other_than: 0 }

belongs_to :user
belongs_to :prefecture, :category, :when_post,:item_status, :shipping

end
