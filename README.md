# テーブル設計

## usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :histories
- has_one :destination


## itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| introduction       | text       | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_cost_id   | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_days_id   | integer    | null: false                    |
| user_id            | integer    | null: false, foreign_key: true |

### Association
- has_many :images
- has_many :comments
- has_many :histories
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_cost
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_day 
- belongs_to :user


## destinationsテーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_code  | string     | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| phone_number     | integer    | null: false                    |
| user_id          | integer    | null: false, foreign_key: true |

### Association
- has_one :user


## historiesテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | integer    | null: false, foreign_key: true |
| item_id | integer    | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item