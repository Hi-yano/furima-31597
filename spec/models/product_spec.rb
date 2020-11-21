require 'rails_helper'
describe Product do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '商品出品機能がうまくいくとき' do
      it '必要な情報を適切に入力すると、商品の出品ができること' do
        expect(@product).to be_valid
      end
    end

    context '商品出品機能がうまくいかないとき' do
      it '商品画像を1枚つけることが必須であること' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("出品画像を入力してください")
      end
      it '商品名が必須であること' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明が必須であること' do
        @product.explanation = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("説明欄を入力してください")
      end
      it 'カテゴリーの情報が必須であること' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('カテゴリーは数値で入力してください')
      end
      it 'カテゴリーの情報が未選択（値が1）だと出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
      end

      it '商品の状態についての情報が必須であること' do
        @product.status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('商品の状態は数値で入力してください')
      end
      it '商品の状態が未選択（値が1）だと出品できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('商品の状態は1以外の値にしてください')
      end

      it '配送料の負担についての情報が必須であること' do
        @product.postage_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('配送料の負担は数値で入力してください')
      end
      it '発送料の負担が未選択（値が1）だと出品できない' do
        @product.postage_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('配送料の負担は1以外の値にしてください')
      end

      it '発送元の地域についての情報が必須であること' do
        @product.area_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('発送元の地域は数値で入力してください')
      end
      it '発送元の地域が未選択（値が1）だと出品できない' do
        @product.area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('発送元の地域は1以外の値にしてください')
      end

      it '発送までの日数についての情報が必須であること' do
        @product.shipping_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('発送までの日数は数値で入力してください')
      end
      it '発送までの日数が未選択（値が1）だと出品できない' do
        @product.shipping_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('発送までの日数は1以外の値にしてください')
      end

      it '価格についての情報が必須であること' do
        @product.product_price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("販売価格を入力してください")
      end
      it '価格の範囲が、¥300以上であること' do
        @product.product_price = 100
        @product.valid?
        expect(@product.errors.full_messages).to include('販売価格は300以上の値にしてください')
      end
      it '価格の範囲が、¥9,999,999以内であること' do
        @product.product_price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('販売価格は10000000より小さい値にしてください')
      end
      it '販売価格は半角数字のみ保存可能であること' do
        @product.product_price = '１０００'
        @product.valid?
        expect(@product.errors.full_messages).to include('販売価格は不正な値です')
      end
    end
  end
end
