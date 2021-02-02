FactoryBot.define do
  factory :item do
    item           {Faker::Lorem.word}
    image          {Faker::Lorem.sentence}
    explanation    {Faker::Lorem.sentence}
    price          {Faker::Number.number(digits: 7)}
    category_id    {Faker::Number.within(range: 1..10)}
    prefecture_id  {Faker::Number.within(range: 1..47)}
    when_post_id   {Faker::Number.within(range: 1..3)}
    item_status_id {Faker::Number.within(range: 1..5)}
    shipping_id    {Faker::Number.within(range: 1..2)}
    association :user
  end
end
