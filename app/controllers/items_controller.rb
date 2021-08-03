class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def edit
    @item= Item.find(params[:id])
    move_to_index
  end

  def update
    @item= Item.find(params[:id])
    if @item.update (item_params)
      redirect_to  items_path
    else
      render :edit 
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :condition_id, :postage_type_id,
                                 :prefectures_id, :preparation_day_id, :value).merge(user_id: current_user.id)
  end

  def move_to_index
    unless @item.user_id == current_user.id
     redirect_to action: :index
    end
  end
end
