class VregistrationsController  < Devise::RegistrationsController
 
  
  #def sign_up_params
  #  params.require(:vendor).permit(:shopname, :address, :email, :password, :password_confirmation)
  #end
  
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << :shopname << :address
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << :shopname << :address
  end
  
  def account_update_params
    params.require(:vendor).permit(:shopname, :address, :email, :password, :password_confirmation, :current_password)
  end
end
