# テーブル設計

## users テーブル

| Column      | Type   | Options                   |
| ----------- | ------ | ------------------------- |
| nickname    | string | null: false               |
| email       | string | null: false, unique: true |
| password    | string | null: false, unique: true |
| family_name | string | null: false               |
| first_name  | string | null: false               |
| family_kana | string | null: false               |
| first_kana  | string | null: false               |
| birth_day   | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type        | Options                        |
| -----------  | ----------- | ------------------------------ |
| name         | string      | null: false                    |
| description  | text        | null: false                    |
| category     | string      | null: false                    |
| condition    | string      | null: false                    |
| shipping     | string      | null: false                    |
| prefecture   | string      | null: false                    |
| day          | string      | null: false                    |
| price        | integer     | null: false                    |
| commission   | integer     |                                |
| profit       | integer     |                                |
| user         | references  | null: false, foreign_key: true |

### Association

- has_many :purchases
- belongs_to :user

## purchases テーブル

| Column | Type       | options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

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
| phone_num   | string     | null: false, unique: true      |
| purchase    | references | null: false, foreign_key: true |

### Associations

- belongs_to :purchase