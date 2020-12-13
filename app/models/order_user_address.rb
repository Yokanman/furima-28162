class OrderUserAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: '項目を選択して下さい' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d+\d\z/i, message: '半角数字で、ハイフン無しで入力して下さい' },
                             length: { maximum: 11, message: 'is invalid Input less than 11 charactors.' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    UserAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end
