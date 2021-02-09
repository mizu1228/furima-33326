class Shopping
  include ActiveModel::Model
  attr_accessor :order, :ship_address

  # バリデーションと各テーブルに保存する処理を書く
end