class PurchaseController < ApplicationController
  before_action :authenticate_user!
  
  def checkout
    @products = Product.all
    @order = current_order
    @order_items = current_order.order_items
  end
  
  def confirm
    current_order.order_items.each do |order_item|
      order_item.destroy
    end  
    redirect_to :controller => 'products', :action => :index 
  end
end
