class ItemsController < ApplicationController
 
  def index
  end

  def new
   @item = Item.new
  end

  def create
  end
  
  private
  def item_params
  params.require(:item).permit(:image, :items_name, :explanation, :category_id, :condition_id, :postage_type_id, 
    :prefectures_id, :preparation_day_id, :value, :user).merge(user_id: current_user.id)
  end
end


