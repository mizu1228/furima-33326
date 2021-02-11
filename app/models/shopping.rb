class Shopping

  include ActiveModel::Model
  attr_accessor :item, :price, :image, :building, :address, :city, :prefecture_id, :zip_code, :phone_num, :user_id, :item_id, :order_id

  with_options presence: true do
    validates :address, :city
    validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "はハイフン(-)を入れてください" }
    validates :phone_num, format: { with: /\A\d{10,11}\z/, message: "は半角数字10または11桁で入力してください" }
    validates :prefecture_id, numericality: { other_than: 0, message: "都道府県は必須です" }
  end

  def save
    item = Item.create(item: item, image: image, price: price)
    ShipAddress.create(building: building, address: address, city: city, prefecture_id: prefecture.id, zip_code: zip_code, phone_num: phone_num, user_id: user.id, item_id: item.id)
    Order.create(user_id: user.id, item_id: item.id)
  end

end