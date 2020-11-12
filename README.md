# テーブル設計

## users テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| email         | string  | null: false |
| password      | string  | null: false |
| name          | string  | null: false |
| furigana      | string  | null: false |
| date_of_birth | integer | null: false |
| nickname      | string  | null: false |

### Association

- has_many :products
- has_many :orders
- has_one :buyer

## products テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| product_name  | string     | null: false                    |
| product_price | integer    | null: false                    |
| status        | text       | null: false                    |
| category      | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| area          | string     | null: false                    |
| shipping_date | integer    | null: false                    |

### Association
- belongs_to :user
- has_one : order

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| price_id    | reference  | null: false, foreign_key: true |
| user_id     | reference  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :buyer

## buyers テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| address         | text      | null: false                    |
| phone_number    | integer   | null: false                    |
| user_id         | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order