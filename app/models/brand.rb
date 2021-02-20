class Brand < ApplicationRecord

  validates :brand, uniqueness: true

  has_many :item_brands
  has_many :items, through: :item_brands
  
end
