class OrdersController < ApplicationController

  def index
    @shopping = Shopping.new
    @item = Item.find(params[:item_id])  
  end

  def create
    @item = Item.find(params[:item_id])
    @shopping = Shopping.new(order_params)
      if @shopping.valid?
        Payjp.api_key = "sk_test_1a35502e96cac5fa14571b9f"
        Payjp::Charge.create(
          amount: @item.price,
          card: order_params[:token],
          currency: 'jpy'
        )
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


end