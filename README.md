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

|   Column         |  Type      |   Options   |
| ---------------- | ---------  | ----------- |
| item_name        | string     | null: false |
| item_description | string     | null: false |
| price            | integer    | null: false |
| category_id      | integer    | null: false |
| condition_id     | integer    | null: false |
| ship_charge_id   | integer    | null: false |
| sipping_are_id   | integer    | null: false |
| days_to_ship_id  | integer    | null: false |

### Association

- belongs_to : user
- has_one : buy
- has_many : comments
- has_many : select

## buysテーブル

|   Column      |  Type      |   Options                      |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item
- has_one : shipping

## shippingsテーブル

|   Column      |  Type      |   Options   |
| ------------- | ---------  | ----------- |
| post_code     | string     | null: false |
| prefectures   | integer    | null: false |
| municipality  | string     | null: false |
| address       | string     | null: false |
| building_name | string     | null: false |
| phone_number  | string     | null: false |

### Association

- belongs_to : buy

## commentsテーブル

|   Column  |  Type   |   Options   |
| --------- | ------  | ----------- |
| text      | text    | null: false |

### Association

- belongs_to : user
- belongs_to : item