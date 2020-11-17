class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,                null: false
      t.text    :description,         null: false
      t.integer :category_id,         null: false
      t.integer :condition_id,        null: false
      t.integer :shipping_charger_id, null: false
      t.integer :shipping_from_id,    null: false
      t.integer :days_to_shipping_id, null: false
      t.integer :value              , null: false
      t.integer :user               , null: false
      t.timestamps
    end
  end
end
