class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  # GET /products
  # GET /products.json
  def index
    @categ = params[:category]  
    puts "category: (#{@categ})"
    
    if @categ.blank? 
      row = params[:row].to_i
      if row==0
        @products = Product.all.limit(12)
      else
        min = 1 + 12 * (row - 1) 
        max = 12 * row
        @products = Product.where(id: (min..max))
      end
    else
      @products = Product.where(:category => @categ).first(12).to_a #originalmente Product.all
    end
    @order_item = current_order.order_items.new
  end
  
  def manage
    @categ = params[:category]  
    puts "current vendor: #{current_vendor.shopname}"
    puts "category: (#{@categ})"
    if @categ.blank? 
      @products = Product.where(:vendor_id => current_vendor.id).to_a 
    else
      @products = Product.where(:vendor_id => current_vendor.id, :category => @categ).to_a
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
        puts "product created"
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
      params.require(:product).permit(:name, :price, :description, :address, :id, :vendor_id, :category, :row)
    end
    def new_product_params
      params.require(:product).permit(:name, :price, :description, :address, :id, :vendor_id, :category, :row)
    end
end
