# テーブル設計

## users テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| email                | string  | null: false |
| encrypted_password   | string  | null: false |
| family_name          | string  | null: false |
| name                 | string  | null: false |
| family_name_furigana | string  | null: false |
| name_furigana        | string  | null: false |
| date_of_birth        | date    | null: false |
| nickname             | string  | null: false |

### Association

- has_many :products
- has_many :orders

## products テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| product_name  | string     | null: false                    |
| product_price | integer    | null: false                    |
| status        | text       | null: false                    |
| category_id   | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| area          | string     | null: false                    |
| shipping_date | date       | null: false                    |
| explanation   | text       | null: false                    |

### Association
- belongs_to :user
- has_one : order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| price  | reference  | null: false, foreign_key: true |
| user   | reference  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :buyer

## buyers テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | integer | null: false |
| prefectures   | text    | null: false |
| municipality  | text    | null: false |
| address       | text    | null: false |
| building_name | text    | null: false |
| phone_number  | integer | null: false |

### Association

- belongs_to :order