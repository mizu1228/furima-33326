class UsersController < ApplicationController
  before_action :set_user, only: [:show]


  def show
    @items = Item.order("Created_at DESC")
  end

  def user_delete
    @user = current_user
    @items = Item.order("Created_at DESC")
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
