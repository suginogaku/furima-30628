FactoryBot.define do
  factory :user_address do
    user_id { 1 }
    item_id { 1 }
    token { 'sk_test_99fdc0ee7278febb422d3998' }
    postcode { '000-0000' }
    prefecture_id { 2 }
    city { '東京都港区' }
    block { '赤坂' }
    phone_number { '00000000000' }
  end
end
