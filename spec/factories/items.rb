FactoryBot.define do
  factory :item do
    item_name { 'ninjazx25r' }
    item_explain { '特になし'}
    item_category_id { 2 }
    item_status_id { 2 }
    item_burden_id { 2 } 
    item_prefecture_id { 2 }
    item_day_id { 2 }
    item_price { 301 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
