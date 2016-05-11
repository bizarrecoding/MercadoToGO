class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:name, :email) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :shopname, :secname, :email, :password, :address, :date_of_birth) }
  end
  
  def after_sign_in_path_for(resource)
    puts "resource #{resource}, vendor? #{resource.instance_of? Vendor} "
    if resource.instance_of? Vendor
      landing_vendor_path 
    else
      root_path
    end
  end
  
  helper_method :current_order

  def current_order
    begin
      if !session[:order_id].nil? && !Order.find(session[:order_id]).nil?
      end  
    rescue Exception => e
      session.clear
      puts e.message
      puts e.backtrace.inspect
    end
        
    #debugger
    if !session[:order_id].nil? 
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
