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
|birth                 |integer  |null: false  |

### Association
has_many :items
has_many :addresses

## items テーブル

| Colum           | Type     | Options                     |
| --------------- | -------  | --------------------------- |
|image            |text      |null: false                  |
|items_name       |string    |null: false                  |
|explanation      |text      |null: false                  |
|category         |integer   |null: false                  |
|condition        |integer   |null: false                  |
|postage_type     |integer   |null: false                  |
|prefectures      |integer   |null: false                  |
|preparation_days |integer   |null: false                  |
|value            |integer   |null: false                  |
|user_id          |references|null: false,foreign_key: true|


### Association
belongs_to :user
has_one :item_purchases
belongs_to_active_hash :category
belongs_to_active_hash :condition
belongs_to_active_hash :postage_type
belongs_to_active_hash :prefectures
belongs_to_active_hash :value




## purchases_infoテーブル

| Colum        | Type     | Options                     |
| ------------ | -------- | --------------------------- |
|user_address  |integer   |null: false                  |
|post_number   |integer   |null: false                  |
|prefectures   |integer   |null: false                  |
|city          |string    |null: false                  |
|address       |string    |null: false                  |
|building_name |string    |null: false                  |
|telephone     |integer   |null: false                  |
|user          |references|null: false,foreign_key: true|
|item          |references|null: false,foreign_key: true|

### Association
belongs_to :users
belongs_to :items
belongs_to_active_hash :prefectures

