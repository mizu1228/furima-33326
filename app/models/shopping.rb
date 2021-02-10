class Shopping
  include ActiveModel::Model
  attr_accessor :building, :address, :city, :prefecture_id, :zip_code, :phone_num, :user_id, :item_id, :order_id

  with_options presence: true do
    validates :address, :city, message: "市区町村、番地は必須です"
    validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "はハイフン(-)を入れてください" }
    validates :phone_num, format: { with: /\A\d{10,11}\z/, message: "は半角数字10または11桁で入力してください" }
    validates :prefecture_id, numericality: { other_than: 0, message: "都道府県は必須です" }
  end

  def save
    
  end

end