FactoryBot.define do
  factory :product do
    image           {}
    product_name    {"Tシャツ"}
    explanation     {"未使用品のTシャツです。"}
    category_id     {"00000000"}
    status_id       {"新品・未使用"}
    postage_id      {"送料込み(出品者負担)"}
    area_id         {"沖縄県"}
    shipping_id     {"1~2日で発送"}
    product_price   {"12345"}
  end
end