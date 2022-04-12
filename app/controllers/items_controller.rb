class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
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
    params.require(:item).permit(:title, :discription, :price, :category_id, :condition_id, :charge_id, :source_id,
                                 :scheduled_day_id, :image).merge(user_id: current_user.id)
  end
end
