FactoryBot.define do
  factory :order_shipping do
    post_code { '123-4567' }
    prefecture_id     { 14 }
    city { '東京都' }
    house_number { '1-1-1' }
    building_name { 'ビル1階' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
