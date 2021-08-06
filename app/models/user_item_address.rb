class UserItemAddress

  include ActiveModel::Model
  attr_accessor :post_number, :city, :address, :phone_number, :building_name, :prefectures_id, :user_item_id, :item_id, :user_id, :token

  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :prefectures_id
  end

  with_options presence: true do
    validates :post_number
    validates :city
    validates :address
    validates :phone_number
    validates :user_id
    validates :token
    validates :item_id
  end
  def save
     user_item = UserItem.create(item_id: item_id, user_id: user_id,)
     Address.create(post_number:post_number,prefectures_id: prefectures_id, city: city, address: address, building_name: building_name, phone_number: phone_number,token:token,user_item_id: user_item.id)
  end
end