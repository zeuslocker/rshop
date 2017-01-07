class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    Product.transaction do
    category = Category.find_by_title(product_params[:category_type])
    property_data = product_params[:property_data].split
    @product = category.products.new(product_params)
    property_data.each_slice(3) do |x|
      if x[2] == 'current'
        @product.properties.new(name: x[0], title: x[1], value: Product.last.id+1)
      else
        @product.properties.new(name: x[0], title: x[1], value: x[2])
      end
    end
    product_params[:images_links].split(/[\r\n]+/).each do |x|
      @product.images.new(link: x)
    end
    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_products_path }
      else
        flash[:notice] = "#{@product.errors.messages}"
        format.html { render :new }
      end
    end
    end
  end

  def update
    new_category = Category.find_by_title(product_params[:category_type])
    @product.category = new_category
    @product.properties.destroy_all
    property_data = product_params[:property_data].split
    property_data.each_slice(3) do |x|
      if x[2] == 'current'
        @product.properties.new(name: x[0], title: x[1], value: @product.id)
      else
        @product.properties.new(name: x[0], title: x[1], value: x[2])
      end
    end
    @product.images.destroy_all
    product_params[:images_links].split(/[\r\n]+/).each do |x|
      @product.images.new(link: x)
    end
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_products_path }
      else
        flash[:alert] = "#{@product.errors.messages}"
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_path,
      notice: 'Product was successfully destroyed.' }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
    @product.images_links =  ''.tap { |x| @product.images.each {|y|
       x << y.link + "\n"
       }}
    @product.category_type = @product.category.title
    @product.property_data =  ''.tap { |x| @product.properties.each {|y|
       x << "#{y.name} #{y.title} #{y.value}" + "\n"
       }}
  end

  def product_params
    params.require(:product).permit(:title,
                                    :description,
                                    :price,
                                    :category_type,
                                    :subcategory,
                                    :images_links,
                                    :property_data)
  end
end
