# テーブル設計

## users テーブル

| Column   | Type   |
| -------- | ------ |
| nickname | string |
| email    | string |
| password | string |

### Association

- has_many :items

## items テーブル

| Column      | Type    |
| ----------- | ------- |
| image       | string  |
| item        | string  |
| description | text    |
| user_id     | integer |
| description | integer |

### Association

- belongs_to :users
- belongs_to :orders

## orders テーブル

| Column | Type    |
| ------ | ------- |
| price  | integer |
| token  | string  |

### Association

- has_many :items
- has_one :shipping

## shipping テーブル

| Column      | Type    |
| ----------- | ------- |
| postal_code | string  |
| prefectures | string  |
| address_1   | string  |
| address_2   | string  |
| building    | string  |
| phone_num   | integer |
| order_id    | integer |

### Association

- belongs_to :orders