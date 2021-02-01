class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new[item_params]
      if @item.save
        redirect_to root_path
      else
        render :new
      end
  end
  

  private

  def item_params
    params.require(:item).permit(
      :item, :explanation, :price, :prefecture, :category,
      :when_post,:item_status, :shipping, :image
    )
  end

end
