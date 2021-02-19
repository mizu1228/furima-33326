class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: :update

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