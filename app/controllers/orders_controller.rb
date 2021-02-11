class OrdersController < ApplicationController

  def index
    @shopping = Item.new
    @item = Item.find(8)  #数字を入れたらうまくいったので、IDを取得できるようにしたい
  end

  def create
    @shopping = shopping.find(params[:id])
      if @shopping.valid?
        @shopping.save
        redirect_to root_path
      else
        render :index
      end
  end

  private

  def order_params
    params.require(:shopping).permit(:building, :address, :city, :prefecture_id, :zip_code, :phone_num, :item_id, :user_id)
  end

  def item_params
    params.require(:item).permit(
      :item, 
      :explanation, 
      :price, 
      :prefecture_id,
      :category_id, 
      :when_post_id, 
      :item_status_id, 
      :shipping_id, 
      :image
    ).merge(user_id: current_user.id)
  end

end