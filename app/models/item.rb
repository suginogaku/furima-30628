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

  # エラーメッセージの表示を変更したほうがいい(この記述はあえて残しています)
  with_options numericality: { other_than: 1 } do
    validates :category_id, :status_id, :burden_id, :prefecture_id, :day_id
  end

  validates :item_price, presence: true, numericality: { only_integer: true, message: 'は半角数字を使用して下さい' }
  validates :item_price, numericality: {
    greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '300以上9,999,999未満で入力して下さい'
  }
end
