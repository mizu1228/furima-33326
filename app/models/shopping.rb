class Shopping

  include ActiveModel::Model
  attr_accessor :building, :address, :city, :prefecture_id, :zip_code, :phone_num, :user_id, :item_id, :token

  with_options presence: true do
    validates :address, :city
    validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "はハイフン(-)を入れてください" }
    validates :phone_num, format: { with: /\A\d{10,11}\z/, message: "は半角数字10または11桁で入力してください" }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "は必須です" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShipAddress.create(building: building, address: address, city: city, prefecture_id: prefecture_id, zip_code: zip_code, phone_num: phone_num, order_id: order.id)
  end

end