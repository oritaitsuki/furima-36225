class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  
  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :postage_type_id
    validates :prefectures_id
    validates :preparation_day_id
  end

  validates :image, presence: true
  validates :item_name, presence: true
  validates :explanation, presence: true

  validates :value, presence: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }

  has_one_attached :image
  belongs_to :user
  has_one :user_item
end
