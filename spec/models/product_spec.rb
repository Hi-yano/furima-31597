require 'rails_helper'
describe Product do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '商品出品機能がうまくいくとき' do
      it '必要な情報を適切に入力すると、商品の出品ができること' do
        @product.valid?
      end

      it "商品画像を1枚つけることが必須であること" do
      end
      it "商品名が必須であること" do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end
      it "商品の説明が必須であること" do
        @product.explanation = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリーの情報が必須であること" do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category is not a number")
      end
      it "商品の状態についての情報が必須であること" do
        @product.status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Status is not a number")
      end
      it "配送料の負担についての情報が必須であること" do
        @product.postage_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Postage is not a number")
      end
      it "発送元の地域についての情報が必須であること" do
        @product.area_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Area is not a number")
      end
      it "発送までの日数についての情報が必須であること" do
        @product.shipping_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping is not a number")
      end
      it "価格についての情報が必須であること" do
        @product.product_price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product price can't be blank")
      end
      it "価格の範囲が、¥300以上であること" do
        @product.product_price = 100
        @product.valid?
        expect(@product.errors.full_messages).to include("Product price must be greater than or equal to 300")
      end
      it "価格の範囲が、¥9,999,999以内であること" do
        @product.product_price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Product price must be less than 10000000")
      end
      it "販売価格は半角数字のみ保存可能であること" do
        @product.product_price = "１０００"
        @product.valid?
        expect(@product.errors.full_messages).to include("Product price is not a number")
      end
    end
  end
end