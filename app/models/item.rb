class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :postage_type_id
    validates :prefectures_id
    validates :preparation_day_id
  end
  with_options presence: true do
    validates :image
    validates :item_name
    validates :explanation
    validates :value, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end

  has_one_attached :image
  belongs_to :user
  belongs_to :postage_type
  belongs_to :category
  belongs_to :condition
  belongs_to :prefectures
  belongs_to :preparation_day
  # has_one :user_item
end
