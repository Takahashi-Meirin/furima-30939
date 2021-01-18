# テーブル設計

## usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| birth_day          | date   | null: false |

### Association
- has_many :items
- has_many :comments
- has_one :destinations


## itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| introduction       | text       | null: false                    |
| price              | integer    | null: false                    |
| category_id        | references | null: false, foreign_key: true |
| condition_id       | references | null: false, foreign_key: true |
| shipping_cost_id   | text       | null: false                    |
| prefecture_id      | string     | null: false                    |
| shipping_days_id   | references | null: false, foreign_key: true |
| user_id            | integer    | null: false, foreign_key: true |

### Association
- has_many :images
- has_many :comments
- belongs_to :categories
- belongs_to :conditions
- belongs_to :shipping_costs
- belongs_to :prefectures
- belongs_to :shipping_days 
- belongs_to :users


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


## categoriesテーブル
| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| category_name | string | null: false |
| ancestry      | string |             |

### Association
- belongs_to :product


## imagesテーブル
| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| image         | string  | null: false                    |
| product_id    | integer | null: false, foreign_key: true |

### Association
- belongs_to :product


## conditionsテーブル
| Column    | Type    | Options     |
| --------  | ------- | ----------- |
| condition | string  | null: false |

### Association
- belongs_to :product


## shipping_costsテーブル
| Column        | Type    | Options     |
| ------------  | ------- | ----------- |
| shipping_cost | string  | null: false |

### Association
- belongs_to :product


## shipping_daysテーブル
| Column        | Type    | Options     |
| ------------  | ------- | ----------- |
| shipping_day  | string  | null: false |

### Association
- belongs_to :product


## prefecturesテーブル
| Column        | Type    | Options     |
| ------------  | ------- | ----------- |
| prefecture    | string  | null: false |

### Association
- belongs_to :product


## commentsテーブル
| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| comment      | text       | null: false |

### Association
- belongs_to :users
- belongs_to :items

