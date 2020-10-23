# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| email           | string | not null    |
| password        | string | not null    |
| nickname        | string | not null    |
| birth_date      | date   | not null    |
| last name       | string | not null    |
| first name      | string | not null    |
| last name kana  | string | not null    |
| first name kana | string | not null    |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column          | Type       | Options     |
| ------          | ------     | ----------- |
| name            | string     | not null--- |
| text            | text       | not null--- |
| price           | integer    | not null--- |
| status_id       | integer    | not null--- |
| delivery fee_id | integer    | not null--- |
| prefecture_id   | integer    | not null--- |
| delivery day_id | integer    | not null--- |
| category_id     | integer    | not null--- |
| user            | references | not null--- |


### Association

- belongs_to :user
- has_one buy

## buys テーブル

| Column          | Type       | Options  |
| -------         | ---------- | -------- |
| postal code     | string     | not null |
| prefecture_id   | integer    | not null |
| city            | string     | not null |
| address         | string     | not null |
| building        | string     | -------- |
| phone number    | string     | not null |
| user            | references | not null |


### Association

- belongs_to :user
- belongs_to :item

## user_item テーブル

| Column  | Type       | Options     |
| ------  | ------     | ----------- |
| user_id | references | not null    |
| item_id | references | not null    |

### Association

- has_one :user
- has_one :item