# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| --------------------| ------ | ----------- |
| nickname            | string | null: false, unique: true|
| email               | string | null: false, unique: true|
| encrypted_password  | string | null: false |
| first_name          | string | null: false |
| family_name         | string | null: false |
| first_name_kana     | string | null: false |
| family_name_kana    | string | null: false |
| birth_day           | date   | null: false |

### Association

- has_many :users_purchase_logs
- has_many :items

## user_addresses テーブル

| Column        | Type       | Options           |
| --------------| -----------| -----------       |
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| house_number  | string     | null: false       |
| building      | string     |                   |
| phone_number  | string     | null: false                    |
| user_purchase_log| references | null: false, foreign_key: true |

### Association

- belongs_to :users_purchase_log

## items テーブル

| Column             | Type       | Options     |
| -------------------| -----------| ----------- |
| name               | string     | null: false |
| description        | text       | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| shipping_charger_id| integer    | null: false |
| shipping_from_id   | integer    | null: false |
| days_to_shipping_id| integer    | null: false |
| value              | integer    | null: false |
| sale_condition_id  | integer    | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- has one :users_purchase_log
- belongs_to :user


## users_purchase_logs テーブル

| Column          | Type       | Options     |
| ----------------| -----------| ----------- |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :user_address