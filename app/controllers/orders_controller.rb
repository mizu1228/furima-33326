class OrdersController < ApplicationController
before_action :set_item, only: [:index, :create]
  def index
    if current_user.id != @item.user_id && @item.order.nil?
    @shopping = Shopping.new
    @item = Item.find(params[:item_id])  
    else
      redirect_to root_path
    end
  end

  def create
    @shopping = Shopping.new(order_params)
      if @shopping.valid?
        pay_item
        @shopping.save
        redirect_to root_path
      else
        render :index
      end
  end

  private

  def order_params
    params.require(:shopping).permit(:building, :address, :city, :prefecture_id, :zip_code, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV[ "PAYJP_SECRET_KEY" ]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

end