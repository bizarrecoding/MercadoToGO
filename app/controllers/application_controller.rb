class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:name, :email) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :secname, :email, :password, :address, :date_of_birth) }
  end
  
  helper_method :current_user_id
  def current_user_id
    current_user.id
  end
  
  
  helper_method :current_order

  def current_order
    #session.clear
    #debugger
    if !session[:order_id].nil? 
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
