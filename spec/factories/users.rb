FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { '000aaa' }
    password_confirmation { '000aaa' }
    first_name { '鈴木' }
    last_name { '一郎' }
    first_name_kana { 'スズキ' }
    last_name_kana { 'イチロウ' }
    birthday { '1973-10-22' }
  end
end
