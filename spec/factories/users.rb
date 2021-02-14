FactoryBot.define do
  factory :user do
    name                   { 'testねーむ' }
    email                  {Faker::Internet.free_email}
    password               { "testpass123" }
    password_confirmation  {password}
    first_name             { "テストみょう字" }
    last_name              { "てすト名前" }
    first_name_kana        { "ミョウジ" }
    last_name_kana         { "ナマエ" }
    birth_day              {Faker::Date.birthday(min_age: 0, max_age: 85)}
  end
end