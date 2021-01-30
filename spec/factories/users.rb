FactoryBot.define do
  factory :user do
    name                   {Faker::Name.intials(number: 2)}
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password(min_length: 6)}
    password_confirmation  {password}
    first_name             {"テストみょう字"}
    last_name              {"てすト名前"}
    first_name_kana        {"ミョウジ"}
    last_name_kana         {"ナマエ"}
    birth_day              {Faker::Date.birthday(min_age: 18, max_age: 100)}
  end
end