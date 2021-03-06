class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, only: [:index, :create]

  def index
    if current_user.id == @item.user_id || @item.purchase
      redirect_to root_path
    else
      @user_purchase = UserAddress.new
    end
  end

  def create
    @user_purchase = UserAddress.new(address_params)
    if @user_purchase.valid?
      pay_item
      @user_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_params
    params.require(:user_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.item_price,  # 商品の値段
      card: address_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
end
