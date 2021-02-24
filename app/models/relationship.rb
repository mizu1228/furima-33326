class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User'
  # class_nameの部分の記述で存在しないfollowクラスを参照することを防ぎ、Userクラスであることを示している

  validates :user_id, presence: true
  validates :follow_id, presence: true

end
