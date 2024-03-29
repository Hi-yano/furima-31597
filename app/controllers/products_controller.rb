class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index, :search, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.order('created_at DESC')
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

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @product.user_id
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @product.user_id
      @product.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :explanation, :category_id, :status_id, :postage_id, :area_id, :shipping_id, :product_price, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
