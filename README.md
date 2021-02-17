# テーブル設計

## usersテーブル

| Column             | Type    | option                      |
| ------------------ | ------- | --------------------------- |
| name               | string  | null:   false               |
| email              | string  | unique: true, null: false   |
| encrypted_password | string  | null:   false               |
| first_name         | string  | null:   false               |
| last_name          | string  | null:   false               |
| first_name_kana    | string  | null:   false               |
| last_name_kana     | string  | null:   false               |
| birth_day          | date    | null:   false               |
| introduce          | text    |                             |

### prof-imageをActiveStorageで管理(任意)

### Association

- has_many :items
- has_many :comments
- has_many :orders

## itemsテーブル

| Column          | Type       | option                         |
| --------------- | ---------- | ------------------------------ |
| item            | text       | null: false                    |
| explanation     | text       | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| category_id     | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| when_post_id    | integer    | null: false                    |
| item_status_id  | integer    | null: false                    |
| shipping_id     | integer    | null: false                    |
| comment_id      | reference  | foreign_key: true              |
| brand_id        | reference  | foreign_key: true              |


### imageはActiveStorageで管理

### Association

- has_many :comments
- has_many :item_brands
- has_many :brands, through: :item_brands
- belongs_to :user
- has_one :order


## commentsテーブル

| Column          | Type       | option                         |
| --------------- | ---------- | ------------------------------ |
| comment         | text       | null: false                    |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## ship_addressテーブル

| Column          | Type        | option                         |
| --------------- | ----------- | ------------------------------ |
| building        | string      |                                |
| address         | string      | null: false                    |
| city            | string      | null: false                    |
| prefecture_id   | integer     | null: false                    |
| zip_code        | string      | null: false                    |
| phone_num       | string      | null: false                    |
| order           | references  | null: false, foreign_key: true |
| user            | references  | null: false, foreign_key: true |

### prefectureはActiveHashで管理

### Association

- belongs_to :user
- belongs_to :order
- belongs_to :prefecture

## orderテーブル

| Column          | Type        | option                         |
| --------------- | ----------- | ------------------------------ |
| user            | references  | null: false, foreign_key: true |
| item            | references  | null: false, foreign_key: true |

### Association

- belongs_to  :user
- belongs_to  :item
- has_one     :ship_address

## brandsテーブル

| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| brand        | string     | null: false                    |
| item_id      | references | null: false, foreign_key: true |

### Association

- has_many :item_brands
- has_many :items, through: :item_brands

## item_brandsテーブル

| Column      | Type       | Option                         |
| ----------- | ---------- | ------------------------------ |
| item_id     | reference  | null: false, foreign_key: true |
| brand_id    | reference  | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :brand

## interesting_itemテーブル

| Column      | Type       | Option                         |
| ----------- | ---------- | ------------------------------ |
| item_id     | reference  | null: false, foreign_key: true |
| user_id     | reference  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## followテーブル

| Column      | Type       | Option                         |
| ----------- | ---------- | ------------------------------ |
| user_id     | reference  | null: false, foreign_key: true |

### Association

- belongs_to :user