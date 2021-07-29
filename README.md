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
has_many :recodes

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
|user_id           |references|null: false,foreign_key: true|


### Association
belongs_to :user
belongs_to :recode
belongs_to_active_hash :category
belongs_to_active_hash :condition
belongs_to_active_hash :postage_type
belongs_to_active_hash :prefectures
belongs_to_active_hash :value

## recodes

| Colum           | Type     | Options                     |
| --------------- | -------- | --------------------------- |
|item             |string    |null: false                  |
|user             |string    |null: false                  |
|purchase_id      |integer   |null: false                  |

### Association
belongs_to :user
has_one :item
has_one :purchase






## purchasesテーブル

| Colum        | Type     | Options                     |
| ------------ | -------- | --------------------------- |
|user_address  |integer   |null: false                  |
|post_number   |integer   |null: false                  |
|prefectures   |integer   |null: false                  |
|city          |string    |null: false                  |
|address       |string    |null: false                  |
|building_name |string    |null: false                  |
|phone_number  |integer   |null: false                  |


### Association
belongs_to recode
has_many :items
belongs_to_active_hash :prefectures

