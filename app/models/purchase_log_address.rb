class PurchaseLogAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :users_purchase_log_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: '項目を選択して下さい' }
    validates :city
    validates :house_number
    validates :building
    validates :phone_number, format: { with: /\A\d+\d\z/i, message: '半角数字で入力して下さい' }
    validates :users_purchase_log_id


  end

  def save
    PurchaseLog.create(user: user, item: item)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building: building, phone_number:phone_number, user_purchase_log: user_purchase_log)
  end

end