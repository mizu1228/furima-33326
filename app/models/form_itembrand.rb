# class FormItembrand
#   include ActiveModel::Model
#   attr_accessor :item, :explanation, :price, :user_id, :category_id, :prefecture_id, :when_post_id, :item_status_id, :shipping_id, :image, :brand

  

#   def save
#     item = Item.create(item: item, explanation: explanation, price: price, user_id: user_id, category_id: category_id, prefecture_id: prefecture_id, when_post_id: when_post_id, item_status_id: item_status_id, shipping_id: shipping_id, image: image)
#     brand = Brand.where(brand: brand).first_or_initialize
#     brand.save

#     ItemBrand.create(brand_id: brand.id, item_id: item.id)
#   end

# end