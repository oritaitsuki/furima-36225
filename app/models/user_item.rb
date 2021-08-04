class UserItem < ApplicationRecord
  belongs_to :item
  has_many :adresses
end
