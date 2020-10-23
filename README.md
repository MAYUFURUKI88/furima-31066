# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| email      | string | not null    |
| password   | string | not null    |
| nickname   | string | not null    |
| birth_date | date   | not null    |
| last name  | string | not null    |
| first name | string | not null    |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column       | Type       | Options     |
| ------       | ------     | ----------- |
| image        | string     | not null    |
| name         | string     | not null--- |
| text         | text       | not null--- |
| price        | integer    | not null--- |
| status       | integer    | not null--- |
| delivery fee | integer    | not null--- |
| prefecture   | integer    | not null--- |
| delivery day | integer    | not null--- |
| category     | integer    | not null--- |
| user         | references | not null--- |


### Association

- belongs_to :users
- has_one buy

## buys テーブル

| Column       | Type       | Options  |
| -------      | ---------- | -------- |
| token        | ---------- | -------- |
| postal code  | integer    | not null |
| prefecture   | integer    | not null |
| city         | string     | not null |
| address      | string     | not null |
| phone number | string     | not null |
| user         | references | not null |


### Association

- belongs_to :user
- belongs_to :item