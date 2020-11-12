# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_kana    | string  | null: false |
| last_name_kana     | string  | null: false |
| date_of_birth      | date    | null: false |
| nickname           | string  | null: false |

### Association

- has_many :products
- has_many :orders

## products テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| product_name     | string     | null: false                    |
| product_price    | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| area_id          | string     | null: false                    |
| shipping_date_id | integer    | null: false                    |
| explanation      | text       | null: false                    |
| postage_id       | integer    | null: false                    |

### Association
- belongs_to :user
- has_one : order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| product | reference  | null: false, foreign_key: true |
| user    | reference  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :buyer

## buyers テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postal_code    | string  | null: false |
| prefectures_id | integer | null: false |
| municipality   | string  | null: false |
| address        | string  | null: false |
| building_name  | string  |             |
| phone_number   | integer | null: false |

### Association

- belongs_to :order