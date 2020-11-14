require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '購入情報の保存' do
    before do
      @order_shipping = FactoryBot.build(:order_shipping)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_shipping).to be_valid
    end

    # ここからpost_code
    it 'post_codeが空だと保存できないこと' do
      @order_shipping.post_code = nil
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeにハイフンがないと保存できないこと' do
      @order_shipping.post_code = '1234567'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it 'post_codeの前半の数字が足りないと保存できないこと' do
      @order_shipping.post_code = '12-4567'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it 'post_codeの前半の数字が多いと保存できないこと' do
      @order_shipping.post_code = '1234-4567'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it 'post_codeの後半の数字が足りないと保存できないこと' do
      @order_shipping.post_code = '123-456'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it 'post_codeの後半の数字が多いと保存できないこと' do
      @order_shipping.post_code = '123-45678'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end

    # ここからprefecture_id
    it 'prefecture_idを選択していないと保存できないこと' do
      @order_shipping.prefecture_id = nil
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
    end

    # ここからcity
    it 'cityが空だと保存できないこと' do
      @order_shipping.city = nil
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("City can't be blank")
    end

    # ここからhouse_number
    it 'house_numberが空だと保存できないこと' do
      @order_shipping.house_number = nil
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("House number can't be blank")
    end

    # ここからbuilding_name
    it 'building_nameは空でも保存できること' do
      @order_shipping.building_name = nil
      expect(@order_shipping).to be_valid
    end

    # ここからphone_number
    it 'phone_numberが空だと保存できないこと' do
      @order_shipping.phone_number = nil
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberの入力桁数が少ない時は保存できないこと' do
      @order_shipping.phone_number = '0901234567'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('Phone number は正確に入力してください')
    end
    it 'phone_numberの入力桁数が多い時は保存できないこと' do
      @order_shipping.phone_number = '090-1234-5678'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('Phone number は正確に入力してください')
    end

    # ここからtoken
    it 'tokenが空では登録できないこと' do
      @order_shipping.token = nil
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
    end
  end
end
