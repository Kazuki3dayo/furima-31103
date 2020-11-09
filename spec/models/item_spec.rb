require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    it '全ての情報が登録されていれば出品できること' do
      expect(@item).to be_valid
    end

    # 出品画像
    it 'imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    # 商品名
    it 'name(商品名)が空では登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    # 商品説明
    it 'description(商品説明欄)が空では登録できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    # カテゴリー
    it 'category_id(カテゴリー)が選択されていなければ登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category の詳細情報を選択してください')
    end

    # コンディション
    it 'condition_id(コンディション)が選択されていなければ登録できないこと' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition の詳細情報を選択してください')
    end

    # 配送料
    it 'ship_charge_id(配送料の負担)が選択されていなければ登録できないこと' do
      @item.ship_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Ship charge の発送情報を選択してください')
    end

    # 発送地域
    it 'prefecture_id(発送元の地域)が選択されていなければ登録できないこと' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture の発送情報を選択してください')
    end

    # 発送までの日数
    it 'days_to_ship_id(発送までの日数)が選択されていなければ登録できないこと' do
      @item.days_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Days to ship の発送情報を選択してください')
    end

    # 以下販売価格関係
    it 'priceの値が空だと登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceの値が¥300以下では登録できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price は¥300〜¥9,999,999の範囲内で入力してください')
    end

    it 'priceの値が¥9,999,999以上では登録できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price は¥300〜¥9,999,999の範囲内で入力してください')
    end

    it 'priceの値は半角数字以外は登録できないこと' do
      @item.price = '５０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price は¥300〜¥9,999,999の範囲内で入力してください')
    end
  end
end
