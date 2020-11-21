class OrderBuyer
  include ActiveModel::Model
  attr_accessor :prefecture_id, :municipality, :address, :building_name, :phone_number, :postal_code, :user_id, :product_id, :token

  validates :prefecture_id, numericality: { other_than: 1 }
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :user_id
    validates :product_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Buyer.create(prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, postal_code: postal_code, order_id: order.id)
  end
end
