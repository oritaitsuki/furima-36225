class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :category_id, presence: true

  belongs_to :condition
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, presence: true

  belongs_to :postage_type
  validates :postage_type_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_type_id, presence: true

  belongs_to :prefectures
  validates :prefectures_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :prefectures_id, presence: true

  belongs_to :preparation_day
  validates :preparation_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :preparation_day_id, presence: true

  validates :value, presence: true
  validates :image, presence: true
  validates :item_name, presence: true
  validates :explanation, presence: true

  validates :value, presence: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }

  has_one_attached :image
  belongs_to :user
  has_one :user_item
end
