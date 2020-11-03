# テーブル設計

## usersテーブル

|   Column      |  Type      |   Options                      |
| ------------- | ---------- | ------------------------------ |
| nickname      | string     | null: false                    |
| email         | string     | null: false                    |
| password      | string     | null: false                    |
| last_name     | string     | null: false                    |
| first_name    | string     | null: false                    |
| last_name2    | string     | null: false                    |
| first_name2   | string     | null: false                    |
| birth_year    | references | null: false, foreign_key: true |
| birth_month   | references | null: false, foreign_key: true |
| birth_day     | references | null: false, foreign_key: true |

### Association

- has_many : items
- has_many : buys
- has_many : comments
- has_one : birth

## itemsテーブル

|   Column         |  Type      |   Options                      |
| ---------------- | ---------  | ------------------------------ |
| item_name        | string     | null: false                    |
| item_description | string     | null: false                    |
| price            | integer    | null: false                    |
| category         | references | null: false, foreign_key: true |
| condition        | references | null: false, foreign_key: true |
| ship_charge      | references | null: false, foreign_key: true |
| sipping_area     | references | null: false, foreign_key: true |
| days to ship     | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- has_one : buy
- has_many : comments
- has_many : select

## buysテーブル

|   Column      |  Type   |   Options   |
| ------------- | ------  | ----------- |
| valid_month   | integer | null: false |
| valid_year    | integer | null: false |
| security_code | integer | null: false |

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