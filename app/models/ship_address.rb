class ShipAddress < ApplicationRecord

  belongs_to :user
  belongs_to :order
  belongs_to :prefecuture
end
