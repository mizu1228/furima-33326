FactoryBot.define do
  factory :shopping do
    token          { 'tok_abcdefghijk00000000000000000' }
    zip_code       { '000-0000' }
    prefecture_id  { 2 }
    city           { '八戸市' }
    address        { '大字市川町字桔梗野' }
    building       { '過去いたとこ！' }
    phone_num      { '99999999999' }
    user_id        { 1 }
    item_id        { 1 }
  end
end
