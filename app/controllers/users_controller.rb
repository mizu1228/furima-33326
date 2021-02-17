class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @items = Item.order("Created_at DESC")
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

end
