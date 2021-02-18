class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @items = Item.order("Created_at DESC")
  end


end
