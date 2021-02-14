FactoryBot.define do
  factory :item do
    item           { 'test商品' }
    explanation    { 'test商品です' }
    price          { 8888 }
    category_id    { 3 }
    prefecture_id  { 2 }
    when_post_id   { 2 }
    item_status_id { 3 }
    shipping_id    { 1 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end 
  end
end
