class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        product_params[:images_links].split(/[\r\n]+/).each{|x| @product.images.create!(link: x)}
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        @product.images.destroy_all
        product_params[:images_links].split(/[\r\n]+/).each{|x| @product.images.create!(link: x)}
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
     @product.images_links =  "".tap{|x| @product.images.each{|y| x << y.link+"\n"}}
      end

  def product_params
    params.require(:product).permit(:title, :description, :price, :category, :subcategory, :images_links)
  end
  def product_edit_params
  params.require(:product).permit(:title, :description, :price, :category, :subcategory, :images_links)
  end
end
