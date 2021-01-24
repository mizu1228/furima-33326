# テーブル設計

## usersテーブル

| Column          | Type   | option      |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth_year      | string | null: false |
| birth_month     | string | null: false |
| birth_day       | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## itemsテーブル

| Column          | Type       | option                         |
| --------------- | ---------- | ------------------------------ |
| item            | string     | null: false                    |
| explanation     | text       | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_kew :true |

### imageはActiveStorageで管理

### Association

- has_many :comments
- belongs_to :user
- has_one :oder

## commentsテーブル

| Column          | Type       | option                         |
| --------------- | ---------- | ------------------------------ |
| comment         | text       | null: false                    |
| user            | references | null: false, foreign_kew :true |
| item            | references | null: false, foreign_kew :true |

### Association

- belongs_to :user
- belongs_to :item

## ordersテーブル

| Column          | Type        | option                         |
| --------------- | ----------- | ------------------------------ |
| address1        | string      | null: false                    |
| address2        | string      | null: false                    |
| city            | string      | null: false                    |
| state_province  | string      | null: false                    |
| zip_code        | integer     | null: false                    |
| phone_num       | integer     | null: false                    |
| user            | references  | null: false, foreign_kew :true |
| item            | references  | null: false, foreign_kew :true |

### Association

- belongs_to :user
- belongs_to :item
