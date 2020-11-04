class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @item = Item.order('created_at DESC')
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

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    # permitの記述にカラムを追加する
    params.require(:item).permit(:image, :item_name, :item_explain, :category_id, :status_id, :burden_id, :prefecture_id, :day_id, :item_price).merge(user_id: current_user.id)
  end
end
