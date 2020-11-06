FactoryBot.define do
  factory :item do
    item_name { 'ninjazx25r' }
    item_explain { '特になし' }
    category_id { 2 }
    status_id { 2 }
    burden_id { 2 }
    prefecture_id { 2 }
    day_id { 2 }
    item_price { 301 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
