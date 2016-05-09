class OrderItemsController < ApplicationController
  def create
    session[:order_id] = nil unless session[:order_id]
    @order = current_order
    copy = @order.order_items.where(:product_id => order_item_params[:product_id])
      #puts "copy id = #{copy.id rescue puts (-1)}"
      #puts "new? #{copy.blank?}"
      #puts "copy: #{copy}"
    if copy.blank?
      @order_item = @order.order_items.new(order_item_params)
    else
      puts "copy product quantity before: #{copy.first.quantity}"
      copy.first.quantity = copy.first.quantity + order_item_params[:quantity].to_i
      puts "copy product quantity after: #{copy.first.quantity}"
      copy.first.save
    end  
    @order.save
    session[:order_id] = @order.id
    redirect_to products_path
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order 
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end
  
  private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
  def copy_params
    params.require(:order_item).permit(:product_id)
  end
end
