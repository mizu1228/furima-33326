class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: :update

  # def new             ウィザード形式で登録するためのメソッド、不完全
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(sign_up_params)
  #   binding.pry
  #     unless @user.valid?
  #       render :new and return
  #     end
  #   session["devise.regist_data"] = {user: @user.attributes}
  #   binding.pry
  #   session["devise.regist_data"][:user]["password"] = params[:user][:password]
  #   binding.pry
  #   @address = @user.build_address
  #   render :new_address
  # end

  # def create_address
  #   @user = User.new(session["devise.regist_data"]["user"])
  #   @address = Address.new(address_params)
  #     unless @address.valid?
  #       render :new_address and return
  #     end
  #   @user.build_address(@address.attributes)
  #   @user.save
  #   session["devise.regist_data"]["user"].clear
  #   sign_in(:user, @user)
  # end

  def destroy
    resource.soft_delete
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed
    yield resource if block_given?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    user_path(@user.id)
  end

  # def address_params
  #   params.require(:address).permit(:zip_code, :prefecture_id)
  # end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :name, 
      :email, 
      :first_name, 
      :last_name, 
      :first_name_kana, 
      :last_name_kana, 
      :birth_day, 
      :introduce, 
      :image
    ])
  end
end