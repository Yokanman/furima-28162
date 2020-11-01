# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| --------------------| ------ | ----------- |
| nickname            | string | unique: true|
| email_address       | string | unique: true|
| password            | string | null: false |
| first_name          | string | null: false |
| family_name         | string | null: false |
| first_name_kana     | string | null: false |
| family_name_kana    | string | null: false |
| birth_day           | date   | null: false |

### Association

- has_many :buyers
- has_many :sell_items

## buyers テーブル

| Column        | Type    | Options     |
| --------------| ------- | ----------- |
| postal_code   | string  | null: false |
| prefecture    | integer | null: false |
| city          | string  | null: false |
| house_number  | string  | null: false |
| building      | string  |             |
| phone_number  | integer | null: false |
| user_id       | integer | null: false |

### Association

- belongs_to :users
- has_one    :sell_items

## sell_items テーブル

| Column           | Type    | Options     |
| -----------------| ------- | ----------- |
| item_name        | string  | null: false |
| item_description | text    | null: false |
| category         | integer | null: false |
| item_condition   | integer | null: false |
| shipping_charger | integer | null: false |
| shipping_from    | integer | null: false |
| days_to_shipping | integer | null: false |
| value            | integer | null: false |
| sale_condition   | integer | null: false |
| user_id          | integer | null: false |

### Association

- belongs_to :users
- has_one    :buyers
