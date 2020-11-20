require 'rails_helper'
RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  it "priceがあれば保存ができること" do
    expect(@order).to be_valid
  end

  it "priceが空では保存ができないこと" do
    @order.product_price = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Price can't be blank")
  end
end