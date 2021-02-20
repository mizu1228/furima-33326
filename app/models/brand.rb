class Brand < ApplicationRecord

  has_many :item_brands
  has_many :items, through: :item_brands
  
end
