class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_item_params, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :sold_out, only: [:edit, :update, :destroy]
  
  def index
    @items = Item.includes(:user,:user_item).order('created_at DESC')
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
   
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :condition_id, :postage_type_id,
                                 :prefectures_id, :preparation_day_id, :value).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless @item.user_id == current_user.id
  end

  def sold_out
    unless @item.user_item==nil
      redirect_to root_path
    end
  end
   
  def get_item_params
    @item = Item.find(params[:id])
  end
end
