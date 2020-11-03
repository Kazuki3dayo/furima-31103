# テーブル設計

## usersテーブル

|   Column   |  Type  |   Options   |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| 名字（漢字） | string | null: false |
| 名前（漢字） | string | null: false |
| 名字（カナ） | string | null: false |
| 名前（カナ） | string | null: false |

### Association

- has_many : items
- has_many : buys
- has_many : comments
- has_one : birth

## itemsテーブル

|   Column         |  Type   |   Options   |
| ---------------- | ------  | ----------- |
| item_name        | string  | null: false |
| item_description | string  | null: false |
| price            | integer | null: false |

### Association

- belongs_to : user
- has_one : buy
- has_many : comments
- has_many : select

## buysテーブル

|   Column      |  Type   |   Options   |
| ------------- | ------  | ----------- |
| card_number   | integer | null: false |
| valid_month   | integer | null: false |
| valid_year    | integer | null: false |
| security_code | integer | null: false |

### Association

- belongs_to : user
- belongs_to : item
- has_one : shipping

## shippingsテーブル

|   Column      |  Type   |   Options   |
| ------------- | ------  | ----------- |
| post_code     | integer | null: false |
| municipality  | string  | null: false |
| address       | text    | null: false |
| building_name | text    | null: false |
| phone_number  | integer | null: false |

### Association

- belongs_to : buy

## commentsテーブル

|   Column  |  Type   |   Options   |
| --------- | ------  | ----------- |
| text      | text    | null: false |

### Association

- belongs_to : user
- belongs_to : item