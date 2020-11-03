class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @item = Item.order('created_at DESC')
    # @burden = Burden.order('id DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    # permitの記述にカラムを追加する
    params.require(:item).permit(:image, :item_name, :item_explain, :item_category_id, :item_status_id, :item_burden_id, :item_prefecture_id, :item_day_id, :item_price).merge(user_id: current_user.id)
  end
end
