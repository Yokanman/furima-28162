require 'rails_helper'

RSpec.describe OrderUserAddress, type: :model do
  before do
    @order_user_address = FactoryBot.build(:order_user_address)
  end
  context '商品が購入できない時' do

    it 'user_idが空だと  購入できない' do
      @order_user_address.user_id = nil
      @order_user_address.valid?
      expect(@order_user_address.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空だと  購入できない' do
      @order_user_address.item_id = nil
      @order_user_address.valid?
      expect(@order_user_address.errors.full_messages).to include("Item can't be blank")
    end

    it '郵便番号が空だと  購入できない' do
      @order_user_address.postal_code = nil
      @order_user_address.valid?
      expect(@order_user_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号にハイフンがないと  購入できない' do
      @order_user_address.postal_code = 1_111_111
      @order_user_address.valid?
      expect(@order_user_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it '都道府県が選択されていないと  購入できない' do
      @order_user_address.prefecture_id = 0
      @order_user_address.valid?
      expect(@order_user_address.errors.full_messages).to include('Prefecture 項目を選択して下さい')
    end

    it '市町村区が空だと  購入できない' do
      @order_user_address.city = nil
      @order_user_address.valid?
      expect(@order_user_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空だと  購入できない' do
      @order_user_address.house_number = nil
      @order_user_address.valid?
      expect(@order_user_address.errors.full_messages).to include("House number can't be blank")
    end

    it '電話番号が空だと  購入できない' do
      @order_user_address.phone_number = nil
      @order_user_address.valid?
      expect(@order_user_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号が半角数字でないと  購入できない' do
      @order_user_address.phone_number = '０９０１１１１１１１１'
      @order_user_address.valid?
      expect(@order_user_address.errors.full_messages).to include('Phone number 半角数字で、ハイフン無しで入力して下さい')
    end

    it '電話番号にハイフンがあると  購入できない' do
      @order_user_address.phone_number = '090-1111-1111'
      @order_user_address.valid?
      expect(@order_user_address.errors.full_messages).to include('Phone number 半角数字で、ハイフン無しで入力して下さい')
    end

    it '電話番号が11桁より多いと  購入できない' do
      @order_user_address.phone_number = '090111111112'
      @order_user_address.valid?
      expect(@order_user_address.errors.full_messages).to include('Phone number is invalid Input less than 11 charactors.')
    end
  end

  context '商品が購入できる時' do
    it '全ての情報とtokenがあれば保存できること' do
      expect(@order_user_address).to be_valid
    end

    it 'ビル名がなくても保存できること' do
      @order_user_address.building = nil
      expect(@order_user_address).to be_valid
    end

  end
end
