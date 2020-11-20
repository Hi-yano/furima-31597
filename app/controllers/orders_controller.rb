class OrdersController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @order_buyer = OrderBuyer.new
  end

  def create
    @product = Product.find(params[:product_id])
    @order_buyer = OrderBuyer.new(buyer_params)
    if @order_buyer.valid?
      pay_item
      @order_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:order_buyer).permit(:prefecture_id, :municipality, :address, :building_name, :phone_number, :postal_code).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.product_price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
