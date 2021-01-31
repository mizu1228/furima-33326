class Item < ApplicationRecord

  validates :item, :explanation, :price , presence: true

belongs_to :user

end
