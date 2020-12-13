FactoryBot.define do
  factory :order_user_address do
    user_id                  { 1 }
    item_id                  { 1 }
    postal_code             { '123-1234' }
    prefecture_id           { 1 }
    city                    { '千葉市' }
    house_number             { '1-1-1' }
    building                 { '千葉ビル' }
    phone_number            { '09011111111' }
    token                   { 'tok_abcdefghijk00000000000000000' }
  end
end
