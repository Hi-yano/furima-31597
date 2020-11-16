FactoryBot.define do
  factory :product do
    product_name    { 'Tシャツ' }
    explanation     { '未使用品のTシャツです。' }
    category_id     { '2' }
    status_id       { '2' }
    postage_id      { '2' }
    area_id         { '2' }
    shipping_id     { '2' }
    product_price   { '12345' }
    association :user
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
