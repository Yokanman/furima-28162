require 'rails_helper'

RSpec.describe OrderUserAddress, type: :model do
  before do
    @order_user_address = FactoryBot.build(:order_user_address)
  end
  context '商品が出品できない時' do
    it '画像が空だと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
  context '商品が出品できる時' do

    it '商品のデータが全て存在している場合は出品できる' do
      expect(@item).to be_valid
    end

    it 'valueとtokenがあれば保存できること' do
      expect(@order_user_address).to be_valid
    end

  end
end
