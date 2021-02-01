class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :item, :explanation, :price , presence: true
  validates :prefecture_id, :category_id, numericality: { other_than: 0 }

belongs_to :user
belongs_to :prefecture
belongs_to :category

end
