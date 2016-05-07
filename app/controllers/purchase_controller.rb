class PurchaseController < ApplicationController
  before_action :authenticate_user!
  
  def checkout
    @products = Product.all
    @order = current_order
    @order_items = current_order.order_items
  end
  
  def confirm
    @order = current_order
    #current_order.order_items.each do |order_item|
    #  order_item.destroy
    #end  
    @order.status = "En camino"
    @last_order=Order.last
    new_id = 1
    unless @last_order.nil?
      new_id = @last_order.id + 1
    end
    puts "new: ".chomp
    puts new_id
    current_order = Order.create(id: new_id, subtotal: 0, created_at: Time.now, updated_at: Time.now)
    current_order.save
    session[:order_id] = current_order.id
    redirect_to :controller => 'products', :action => :index 
  end
end
