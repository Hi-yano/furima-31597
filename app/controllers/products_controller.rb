class ProductsController < ApplicationController
  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :explanation, :category_id, :status_id, :postage_id, :area_id, :shipping_id, :product_price, :image).merge(user_id: current_user.id)
  end
end