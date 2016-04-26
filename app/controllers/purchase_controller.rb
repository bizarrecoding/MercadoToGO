class PurchaseController < ApplicationController
  before_action :authenticate_user!
  
  def checkout
    @products = Product.all
    @order = current_order
    @order_items = current_order.order_items
    @purchase = Purchase.new 
  end
  
  def confirm
    @purchase = @purchases.new(purchase_params)
    
    @purchase.save
  end
  
  private
  def purchase_params
    params.require(:purchase).permit(:user_id, :order_id)
  end
end
