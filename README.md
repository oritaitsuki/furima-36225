# テーブル設計

## users テーブル

| Colum                | Type    | Options     |
| -------------------  | ------  | ----------  |
|email                 |string   |null: false  |
|encrypted_password    |string   |null: false  |
|nickname              |string   |null: false  |
|first_name            |string   |null: false  |
|family_name           |string   |null: false  |
|read_first            |string   |null: false  |
|read_family           |string   |null: false  |
|birth                 |date     |null: false  |

### Association
has_many :items
has_many :user_items

## items テーブル

| Colum            | Type     | Options                     |
| ---------------  | -------  | --------------------------- |
|items_name        |string    |null: false                  |
|explanation       |text      |null: false                  |
|category_id       |integer   |null: false                  |
|condition_id      |integer   |null: false                  |
|postage_type_id   |integer   |null: false                  |
|prefectures_id    |integer   |null: false                  |
|preparation_day_id|integer   |null: false                  |
|value             |integer   |null: false                  |
|user              |references|null: false,foreign_key: true|


### Association
belongs_to :user
has_one :user_item
belongs_to_active_hash :category
belongs_to_active_hash :condition
belongs_to_active_hash :postage_type
belongs_to_active_hash :prefectures
belongs_to_active_hash :value

## user_items

| Colum   | Type     | Options                     |
| ------- | -------- | ----------------------------|
|item     |references|null: false,foreign_key: true|
|user     |references|null: false,foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :address

## addressテーブル

| Colum        | Type     | Options                     |
| ------------ | -------- | --------------------------- |
|post_number   |string    |null: false                  |
|prefectures   |integer   |null: false                  |
|city          |string    |null: false                  |
|address       |string    |null: false                  |
|building_name |string    |null: false                  |
|phone_number  |string    |null: false                  |
|user_item     |references|null: false,foreign_key: true|


### Association
belongs_to user_item


