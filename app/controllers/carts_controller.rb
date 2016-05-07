class CartsController < ApplicationController
  def show
     @order_items = current_order.order_items
  end
  
  def clear
    current_order.status = "En camino"
    current_order = Order.new
    
    puts current_order.id
    current_order.id = current_order.id+1
    current_order.save
    puts current_order.id
    debugger
    session[:order_id] = current_order.id
    #current_order.order_items = {}
    #redirect_to :action => :show 
    redirect_to :controller => 'products', :action => :index
  end
end
