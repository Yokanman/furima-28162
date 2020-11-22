require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
  #  it '画像が無いと出品ができない' do
  #    @item.image = ''
  #    @item.valid?
  #    expect(@item.errors.full_messages).to include("image can't be blank")
  #  end
   it '商品名が空だと出品できない' do
    @item.name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("name can't be blank")
   end
   it '商品の説明が空だと出品できない' do
    @item.description = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
   end
   it 'カテゴリーが選択されていないと出品できない' do
    @item.category = '1'
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
   end
  end
end
