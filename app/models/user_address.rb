class UserAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :token

  # createの引数の値の指定方法がいまいちわかっていないからエラーが発生する可能性がある
  # とくにuser_id, item_id, prefecture_id, purchase_id
  # その場合、controllerのストロングパラメータの記述も変更する
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end

  with_options presence: true do
    validates :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :phone_number, :token
  end

  # 必要に応じてmessageの記述を追加する
  validates :prefecture_id, numericality: { other_than: 1, message: 'は空で入力しないで下さい' }
  validates :postcode, format: { with: /\A\d{3}-\d{4}\z/, message: 'はハイフンを指定して下さい' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は11桁以内で入力して下さい' }
end
