FactoryBot.define do
  factory :item do
    name              { 'キウイブラザーズ' }
    description       { 'キウイブラザーズです' }
    price             { 5000 }
    category_id       { 2 }
    condition_id      { 3 }
    ship_charge_id    { 2 }
    prefectures_id    { 19 }
    days_to_ship_id   { 4 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
