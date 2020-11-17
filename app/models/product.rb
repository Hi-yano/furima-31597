class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :area_id
    validates :shipping_id
  end
  with_options presence: true do
    validates :product_name
    validates :explanation
    validates :image
  end
  validates :product_price, presence: true, format: { with: /\A-?[0-9]+(\.[0-9]+)?\z/ }, numericality: { less_than: 10_000_000, greater_than_or_equal_to: 300 }
end
