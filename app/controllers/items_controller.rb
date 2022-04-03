class ItemsController < ApplicationController
  
  
  def index
    
  end

  def new
    if user_signed_in? 
      @item = Item.new
    else
      render template:'devise/sessions/new'
    end
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
    params.require(:item).permit(:title, :discription, :price, :category_id, :condition_id, :charge_id, :source_id, :scheduled_day_id, :image).merge(user_id: current_user.id)
  end
end
