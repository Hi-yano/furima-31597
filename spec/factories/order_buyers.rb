FactoryBot.define do
  factory :order_buyer do
    user_id { 1 }
    product_id { 1 }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    token { 'tok_abcdefghijk00000000000000000' }
    phone_number { '09012345678' }
  end
end
