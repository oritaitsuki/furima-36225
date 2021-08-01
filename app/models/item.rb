class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :user_item
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :prefectures
  belongs_to_active_hash :value
end
