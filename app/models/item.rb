class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :when_post
end
