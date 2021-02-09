class Shopping
  include ActiveModel::Model
  attr_accessor :building, :address, :city, :prefecture_id, :zip_code, :phone_num, :user_id, :item_id

  # バリデーションと各テーブルに保存する処理を書く

  with_options presence: true do
    validates :address, :city, :prefecuture_id, :zip_code, :phone_num
  end
end