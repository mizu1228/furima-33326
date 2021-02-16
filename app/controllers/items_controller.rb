class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :user_judge, only: [:edit, :update]

  def index
    @items = Item.order("Created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new
      end
  end

  def show
  end
  
  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id && @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

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

  def set_item
    if Item != nil
      @item = Item.find(params[:id])
    end
  end

  def user_judge
    if current_user.id != @item.user_id || @item.order != nil
      redirect_to action: :index
    end
  end
end
