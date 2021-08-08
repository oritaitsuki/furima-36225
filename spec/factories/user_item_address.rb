FactoryBot.define do
  factory :user_item_address do
    post_number   {'123-1234'}
    prefectures_id{2}
    city          {'福岡'}
    address       {'1-2-3'}
    building_name {'山田マンション'}
    phone_number  {'09077770008'}
  end
end
