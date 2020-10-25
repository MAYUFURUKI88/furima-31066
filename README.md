# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------              | ------ | ----------- |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| password_confirmation | string | null: false |
| nickname              | string | null: false |
| birth_date            | date   | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| last_name_kana        | string | null: false |
| first_name_kana       | string | null: false |

### Association

- has_many :items
- has_many :user_items

## items テーブル

| Column          | Type       | Options                        |
| ------          | ------     | -----------                    |
| name            | string     | null: false                    |
| text            | text       | null: false                    |
| price           | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| delivery_day_id | integer    | null: false                    |
| category_id     | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :user_item


## addresses テーブル

| Column          | Type       | Options                           |
| -------         | ---------- | --------                          |
| postal_code     | string     | null: false                       |
| prefecture_id   | integer    | null: false                       |
| city            | string     | null: false                       |
| address         | string     | null: false                       |
| building        | string     | --------                          |
| phone_number    | string     | null: false                       |
| user_item       | references | null: false, foreign_key: true    |


### Association

- belongs_to :user_item

## user_items テーブル

| Column  | Type       | Options                           |
| ------  | ------     | -----------                       |
| user    | references | null: false, foreign_key: true    |
| item    | references | null: false, foreign_key: true    |

### Association

- has_one :address
- belongs_to :user
- belongs_to :item