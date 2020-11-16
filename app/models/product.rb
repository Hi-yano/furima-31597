class Product < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id,   numericality: { other_than: 1 }
    validates :postage_id,  numericality: { other_than: 1 }
    validates :area_id,     numericality: { other_than: 1 }
    validates :shipping_id, numericality: { other_than: 1 }
    validates :product_name,  presence: true
    validates :explanation,   presence: true
    validates :product_price, presence: true, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ }, numericality: { less_than: 10000000, greater_than_or_equal_to: 300 }

end