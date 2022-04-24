class PurchasesController < ApplicationController 
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, only: [:index, :create]
  before_action :sold_out, only: [:index, :create]
  before_action :prevent_url, only: [:index, :create]
  def index
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      pay_item
      @purchase_delivery.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_delivery).permit(:post_address, :source_id, :municipality, :address, :building, :phone_number,
                   :user_id).merge(token: params[:token], user_id: current_user.id, item_id: @item.id, price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: purchase_params[:price],  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
  def move_to_index
    @item = Item.find(params[:item_id])
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end
  def sold_out
    if @item.user_id != current_user.id || @item.purchase != nil
      redirect_to root_path
    end
  end
  def prevent_url
    if @item.user_id == current_user.id || @item.purchase != nil
      redirect_to root_path
    end
  end
end
