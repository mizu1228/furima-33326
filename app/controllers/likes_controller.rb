class LikesController < ApplicationController
before_action :item_params

  def create
    user = current_user
    item = Item.find(params[:item_id])
    Like.create(user_id: current_user.id, item_id: item.id)
    redirect_to item_path(params[:id])
  end

  def destroy
    user = current_user
    item = Item.find(params[:item_id])
    Like.find_by(user_id: current_user.id, item_id: item.id).destroy
    redirect_to item_path(params[:id])
  end

  private

  def item_params
    @item = Item.find(params[:id])
  end

end
