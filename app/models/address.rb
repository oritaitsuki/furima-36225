class Address < ApplicationRecord
  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :prefectures_id
  end

  with_options presence: true do
    validates :post_number
    validates :city
    validates :address
    validates :phone_number
  end
  attr_accessor :token

  belongs_to :user_item
  validates :token, presence: true
end
