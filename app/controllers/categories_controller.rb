# frozen_string_literal: true
class CategoriesController < ApplicationController
  before_action :authenticate_admin!, except: [:show]
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  def index
    @categories = Category.all
  end

  def show
    @products = @category.products
  end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: "Category #{@category.title} was created!"
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: "Category #{@category.id} was updated!"
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  def category_params
    params.require(:category).permit(:title)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
