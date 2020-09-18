# テーブル設計

## users テーブル

| Column      | Type   | Options                       |
| ----------- | ------ | ----------------------------- |
| nickname    | string | null: false                   |
| email       | string | null: false, uniqueness: true |
| password    | string | null: false, uniqueness: true |
| family_name | string | null: false                   |
| first_name  | string | null: false                   |
| family_kana | string | null: false                   |
| first_kana  | string | null: false                   |
| birth_day   | date   | null: false                   |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column   | Type        | Options                        |
| -------- | ----------- | ------------------------------ |
| name     | string      | null: false                    |
| feature  | text        | null: false                    |
| price    | integer     | null: false                    |
| user_id  | references  | null: false, foreign_key: true |
| image_id | references  | null: false, foreign_key: true |

### Association

- has_many :purchases
- belongs_to :user
- belongs_to :image

## images テーブル

| Column | Type   | Options    |
| ------ | ------ | ---------- |
| image  | string | null:false |

### Association

- has_many :items

## purchases テーブル

| Column  | Type       | options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | string     | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     |                                |
| phone_num   | string     | null: false, uniqueness: true  |
| purchase_id | references | null: false, foreign_key: true |

### Associations

- belongs_to :purchase