class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy, :similar]

  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def similar
    @product = @product.dup
  end

  def create
    Product.transaction do
      category = Category.find_by_title(product_params[:category_type])
      if product_params[:group].to_i == 0
        @product_group = category.product_groups.create
      else
        @product_group = ProductGroup.find(product_params[:group].to_i)
      end
      property_data = product_params[:property_data].split
      @product = @product_group.products.new(product_params)
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
    Product.transaction do
      new_category = Category.find_by_title(product_params[:category_type])
      @product.product_group.category = new_category
      if product_params[:group].to_i == 0
        @product.product_group = new_category.product_groups.create
      else
        @product.product_group = ProductGroup.find(product_params[:group].to_i)
      end
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
  end


  def destroy
    if @product.product_group.products.count == 1
      product_group = @product.product_group
      @product.destroy
      product_group.destroy
    else
      @product.destroy
    end
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
    @product.category_type = @product.product_group.category.title
    @product.property_data =  ''.tap { |x| @product.properties.each {|y|
       x << "#{y.name} #{y.title} #{y.value}" + "\n"
       }}
    @product.group = @product.product_group.id
  end

  def product_params
    params.require(:product).permit(:title,
                                    :description,
                                    :price,
                                    :category_type,
                                    :subcategory,
                                    :spec,
                                    :show_case,
                                    :images_links,
                                    :property_data,
                                    :group)
  end
end
