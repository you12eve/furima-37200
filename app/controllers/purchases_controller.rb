class PurchasesController < ApplicationController 
  before_action :authenticate_user!, except: :index
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
    binding.pry
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: purchase_params[:price],  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
