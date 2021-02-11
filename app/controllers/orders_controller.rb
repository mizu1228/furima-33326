class OrdersController < ApplicationController

  def index
    @shopping = Shopping.new
    @item = Item.find(params[:item_id])  
  end

  def create
    @item = Item.find(params[:item_id])
    @shopping = Shopping.new(order_params)
      if @shopping.valid?
        @shopping.save
        redirect_to root_path
      else
        render :index
      end
  end

  private

  def order_params
    params.require(:shopping).permit(:building, :address, :city, :prefecture_id, :zip_code, :phone_num, :item_id, :order_id).merge(user_id: current_user.id)
  end


end