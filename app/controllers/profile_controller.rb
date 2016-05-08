class ProfileController < ApplicationController
  def show
    @orders = Order.all.where(:user_id => current_user.id) 
  end
end
