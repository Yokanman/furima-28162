# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| --------------------| ------ | ----------- |
| nickname            | string | unique: true|
| email               | string | unique: true|
| encrypted_password  | string | null: false |
| first_name          | string | null: false |
| family_name         | string | null: false |
| first_name_kana     | string | null: false |
| family_name_kana    | string | null: false |
| birth_day           | date   | null: false |

### Association

- has_one :user_address
- has_many :users_items
- has_many :items through: :users_items

## user_addresses テーブル

| Column        | Type    | Options     |
| --------------| ------- | ----------- |
| postal_code   | string  | null: false |
| prefecture_id | integer | null: false |
| city          | string  | null: false |
| house_number  | string  | null: false |
| building      | string  |             |
| phone_number  | string  | null: false |
| user_id       | integer | index: true |

### Association

- has_one :user

## items テーブル

| Column             | Type    | Options     |
| -------------------| ------- | ----------- |
| name               | string  | null: false |
| description        | text    | null: false |
| category_id        | integer | null: false |
| condition_id       | integer | null: false |
| shipping_charger_id| integer | null: false |
| shipping_from_id   | integer | null: false |
| days_to_shipping_id| integer | null: false |
| value              | integer | null: false |
| sale_condition_id  | integer | null: false |
| user_id            | integer | index: true |

### Association

- has many :users_items
- has_many :users, through: :users_items


## users_items テーブル

| Column             | Type    | Options     |
| -------------------| ------- | ----------- |
| user_id            | integer | index: true |
| item_id            | integer | index: true |
| status             | integer | null: false |


### Association

- belongs_to :user
- belongs_to :item