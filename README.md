# テーブル設計

## usersテーブル
| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| family_name | string | null: false |
| first_name  | string | null: false |
| birth_year  | date   | null: false |
| birth_month | date   | null: false |
| birth_day   | date   | null: false |

### Association
- has_many : items

## itemsテーブル
| Column     | Type         | Options            |
| ---------- | ------------ | ------------------ |
| image      | string       | null: false        |
| item_name | text         | null: false        |
| introduction    | text         | null: false        |
| category      |              | ActiveStorageで実装 |
| condition       | references   |                    |
| shipping_cost | text         | null: false        |
| prefecture_code    | text         | null: false        |
| shipping_days      |              | ActiveStorageで実装 |
| price       | references   |                    |

### Association
- belongs_to : users

## commentsテーブル
| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| comment      | text       | null: false |

## buysテーブル
| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| caed_number      | integer    | null: false |
| expiration_year  | integer    | null: false |
| expiration_month | integer    | null: false |
| security_code    | integer    | null: false |
| post_code        | integer    | null: false |
| prefecture_code  | integer    | null: false |
| municipality     | string     | null: false |
| address          | string     | null: false |
| building         | string     |             |
| phone_number     | integer    | null: false |
| user             | references |             |

### Association
- belongs_to : user