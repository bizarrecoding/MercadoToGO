class CartsController < ApplicationController
  def show
     @order_items = current_order.order_items
  end
  
  def clear
    current_order.order_items = {}
    redirect_to :action => :show 
  end
end
