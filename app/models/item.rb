class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charger
  belongs_to :shipping_from
  belongs_to :days_to_shipping
  belongs_to :sale_condition

  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :shipping_charger_id, numericality: { other_than: 1 } 
  validates :shipping_from_id, numericality: { other_than: 1 } 
  validates :days_to_shipping_id, numericality: { other_than: 1 } 
  validates :sale_condition_id, numericality: { other_than: 1 } 

end
