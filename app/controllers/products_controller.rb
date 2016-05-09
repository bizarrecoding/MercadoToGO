class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  # GET /products
  # GET /products.json
  def index
    #ED WAS HERE
    @categ = params[:category]  
    puts "category: (#{@categ})"
    
    if @categ.blank? 
      @products = Product.all
    else
      @products = Product.where(:category => @categ).to_a #originalmente Product.all
    end
    @order_item = current_order.order_items.new
  end
  
  def manage
    @products = Product.where(:vendorId => current_vendor.id).to_a 
    @categ = params[:category]  
    puts "category: (#{@categ})"
    
    unless @categ.blank? 
      @products = Product.where(:vendorId => current_vendor.id, :category => @categ).to_a
    end
  end
  
  # GET /products/1
  # GET /products/1.json
  def show
    @order_item = current_order.order_items.new
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(new_product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :pId, :price, :id, :vendorId, :category)
    end
    def new_product_params
      params.require(:product).permit(:name, :pId, :price, :id, :vendorId, :category)
    end
end
