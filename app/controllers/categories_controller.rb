class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
	def index   
		@caregories = Category.all
	end
  def show

  end
  def new
  	@category = Category.new
  end
  def create
  	@category = Category.create!(category_params)
  end
  def category_params
  	params.require(:category).permit(:title)
  end
  private 
  def set_category
    @category = Category.find(params[:id])
  end
end