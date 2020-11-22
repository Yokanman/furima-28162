FactoryBot.define do
  factory :item do
    # image                 { ActionDispatch::Http::UploadedFile:0x00007f901586b198 @tempfile=#<Tempfile:/var/folders/8l/kz6cq8ls77x_0y8pj997dyd00000gn/T/RackMultipart20201122-50882-1qtxsvi.jpg>, @original_filename="mouseover-zoomup-image.jpg"}
    name                  { 'cup' }
    description           { 'コップです' }
    category_id              { '2' }
    condition_id             { '2' }
    shipping_charger_id      { '2' }
    shipping_from_id         { '2' }
    days_to_shipping_id      { '2' }
    value                 { '300' }
    user_id               { '1' }
  end
end