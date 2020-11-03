# テーブル設計

## usersテーブル

|   Column           |  Type      |   Options                      |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false                    |
| encrypted_password | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name2         | string     | null: false                    |
| first_name2        | string     | null: false                    |
| birth_day          | references | null: false, foreign_key: true |

### Association

- has_many : items
- has_many : buys
- has_many : comments

## itemsテーブル

|   Column         |  Type      |   Options                      |
| ---------------- | ---------  | ------------------------------ |
| item_name        | string     | null: false                    |
| item_description | string     | null: false                    |
| price            | integer    | null: false                    |
| category_id      | references | null: false, foreign_key: true |
| condition_id     | references | null: false, foreign_key: true |
| ship_charge_id   | references | null: false, foreign_key: true |
| sipping_are_id   | references | null: false, foreign_key: true |
| days_to_ship_id  | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- has_one : buy
- has_many : comments
- has_many : select

## buysテーブル

|   Column      |  Type   |   Options   |
| ------------- | ------  | ----------- |


### Association

- belongs_to : user
- belongs_to : item
- has_one : shipping

## shippingsテーブル

|   Column      |  Type      |   Options                      |
| ------------- | ---------  | ------------------------------ |
| post_code     | string     | null: false                    |
| prefectures   | references | null: false, foreign_key: true |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |

### Association

- belongs_to : buy

## commentsテーブル

|   Column  |  Type   |   Options   |
| --------- | ------  | ----------- |
| text      | text    | null: false |

### Association

- belongs_to : user
- belongs_to : item