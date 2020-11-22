FactoryBot.define do
  factory :item do
    # image                 { 'ynaz7dfd4oooer2ea5sdvoonpua1'}
    name                  { 'cup' }
    description           { 'コップです' }
    category_id              { '2' }
    condition_id             { '2' }
    shipping_charger_id      { '2' }
    shipping_from_id         { '2' }
    days_to_shipping_id      { '2' }
    value                 { '300' }
    association  :user
    # association  :category
    # association  :condition
    # association  :shipping_charger
    # association  :shipping_from
    # association  :days_to_shipping
  end
end