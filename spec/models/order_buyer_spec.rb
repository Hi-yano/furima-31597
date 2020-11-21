require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  describe '購入情報の保存' do
    before do
      @order_buyer = FactoryBot.build(:order_buyer)
    end

    describe '商品購入機能' do
      context '商品購入ががうまくいくとき' do
        it '必要な情報を適切に入力すると、商品の購入ができること' do
          expect(@order_buyer).to be_valid
        end
        it '建物名情報が空でも購入ができること' do
          @order_buyer.building_name = ''
          @order_buyer.valid?
        end
      end

      context '商品出品機能がうまくいかないとき' do
        it '郵便番号が空だと購入ができないこと' do
          @order_buyer.postal_code = ''
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include("郵便番号を入力してください")
        end
        it '都道府県情報が空(値が１)だと購入ができないこと' do
          @order_buyer.prefecture_id = 1
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include('都道府県は1以外の値にしてください')
        end
        it '市区町村情報が空だと購入ができないこと' do
          @order_buyer.municipality = ''
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include("市区町村を入力してください")
        end
        it '番地情報が空だと購入ができないこと' do
          @order_buyer.address = ''
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include("番地を入力してください")
        end
        it '電話番号情報が空だと購入ができないこと' do
          @order_buyer.phone_number = ''
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include("電話番号を入力してください")
        end
        it 'クレジットカード情報は必須であること' do
          @order_buyer.token = ''
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include("クレジットカード情報を入力してください")
        end
        it '郵便番号にはハイフンが必要であること（123-4567となる）' do
          @order_buyer.postal_code = '1234567'
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include('郵便番号は不正な値です')
        end
        it '電話番号にはハイフンは不要で、11桁以内であること（09012345678となる)' do
          @order_buyer.phone_number = '090-1234-5678'
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include('電話番号は不正な値です')
        end
        it '電話番号にはハイフンは不要で、12桁以上の場合は購入できないこと' do
          @order_buyer.phone_number = '090123456789'
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include('電話番号は不正な値です')
        end
      end
    end
  end
end
