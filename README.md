# テーブル設計

## usersテーブル

|   Column           |  Type      |   Options   |
| ------------------ | ---------- | ----------- |
| nickname           | string     | null: false |
| email              | string     | null: false |
| encrypted_password | string     | null: false |
| last_name          | string     | null: false |
| first_name         | string     | null: false |
| last_name_kana     | string     | null: false |
| first_name_kana    | string     | null: false |
| birth_day          | date       | null: false |

### Association

- has_many : items
- has_many : buys
- has_many : comments

## itemsテーブル

|   Column         |  Type      |   Options                      |
| ---------------- | ---------  | ------------------------------ |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| ship_charge_id   | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| days_to_ship_id  | integer    | null: false                    |

### Association

- belongs_to : user
- has_one : buy
- has_many : comments

## buysテーブル

|   Column   |  Type      |   Options                      |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item
- has_one : shipping

## shippingsテーブル

|   Column         |  Type      |   Options                      |
| ---------------- | ---------  | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| buy              | references | null: false, foreign_key: true |

### Association

- belongs_to : buy

## commentsテーブル

|   Column  |  Type      |   Options                      |
| --------- | ---------  | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item