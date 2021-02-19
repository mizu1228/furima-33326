class Comment < ApplicationRecord

  validates :comment, presence: true, length: { maximum: 140 }

  belongs_to :user
  belongs_to :item
end
