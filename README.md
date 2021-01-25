# テーブル設計

## usersテーブル

| Column             | Type   | option      |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth_day          | date   | null: false |

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
| user            | references | null: false, foreign_key: true |
| category        | integer    | null: false                    |
| where_from_item | integer    | null: false                    |
| when_post_item  | integer    | null: false                    |
| items_status    | integer    | null: false                    |
| shipping        | integer    | null: false                    |

### imageはActiveStorageで管理
### category以下のカラムは、ActiveHashで管理

### Association

- has_many :comments
- belongs_to :user
- has_one :oder

## commentsテーブル

| Column          | Type       | option                         |
| --------------- | ---------- | ------------------------------ |
| comment         | text       | null: false                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## ordersテーブル

| Column          | Type        | option                         |
| --------------- | ----------- | ------------------------------ |
| building        | string      |                                |
| address         | string      | null: false                    |
| city            | string      | null: false                    |
| prefecture      | integer     | null: false                    |
| zip_code        | string      | null: false                    |
| phone_num       | string      | null: false                    |
| user            | references  | null: false, foreign_kew :true |
| item            | references  | null: false, foreign_kew :true |

### prefectureはActiveHashで管理

### Association

- belongs_to :user
- belongs_to :item
