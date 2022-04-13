class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :move_to_index]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :discription, :price, :category_id, :condition_id, :charge_id, :source_id,
                                 :scheduled_day_id, :image).merge(user_id: current_user.id)
  end
  def move_to_index
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end
  def set_item
    @item = Item.find(params[:id])
  end
end
