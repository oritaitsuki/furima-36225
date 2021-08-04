class AdressesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_root_paht, only: [:index, :create]
  def index
    @items = Item.find(params[:item_id])
  end

  def create

  end
  
  
  def move_to_root_path
    redirect_to root_path if @item.user_id == current_user.id
  end
end
