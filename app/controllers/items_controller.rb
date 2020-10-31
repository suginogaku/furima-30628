class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    # permitの記述にカラムを追加するかどうかわからない
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end
