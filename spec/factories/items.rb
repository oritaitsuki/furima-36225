FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end

    item_name	           { 'アイテム' }
    explanation	         { 'アイテムです' }
    category_id          { 3 }
    condition_id         { 3 }
    postage_type_id      { 3 }
    prefectures_id   	   { 3 }
    preparation_day_id   { 3 }
    value { 3000 }

    association :user
  end
end
