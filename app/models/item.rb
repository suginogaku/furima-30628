class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day


  with_options presence: true do
    validates :image, :item_name, :item_explain
  end

  with_options presence: true, numericality: { other_than: 1 } do
  validates :item_category_id, :item_status_id, :item_burden_id, :item_prefecture_id, :item_day_id
  end

  validates :item_price, numericality: {
     only_integer: true , message: '半角数字を使用して下さい',
      greater_than_or_equal_to: 300, message: '300以上で入力して下さい',
      less_than_or_equal_to: 9999999, message: '9,999,999以下で入力して下さい'}
      
end
