require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.jpg')
  end
  context '商品が出品できない時' do
    it '画像が空だと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空だと出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が空だと出品できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリーが選択されていない(--)と出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category 項目を選択して下さい')
    end
    it '商品の状態が選択されていない(--)と出品できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition 項目を選択して下さい')
    end
    it '配送料の負担が選択されていない(--)と出品できない' do
      @item.shipping_charger_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping charger 項目を選択して下さい')
    end
    it '配送元の地域が選択されていない(--)と出品できない' do
      @item.shipping_from_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping from 項目を選択して下さい')
    end
    it '配送までの日数が選択されていない(--)と出品できない' do
      @item.days_to_shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Days to shipping 項目を選択して下さい')
    end
    it '価格が空だと出品できない' do
      @item.value = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Value can't be blank")
    end
    it '価格が299円以下だと出品できない' do
      @item.value = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Value 300円以上9,999,999円以下で入力して下さい')
    end
    it '価格が10000000円以上だと出品できない' do
      @item.value = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Value 300円以上9,999,999円以下で入力して下さい')
    end
    it '価格が半角数字ではない出品できない' do
      @item.value = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Value 半角数字で入力して下さい')
    end
  end
  context '商品が出品できる時' do
    it '商品のデータが全て存在している場合は出品できる' do
      expect(@item).to be_valid
    end
  end
end
