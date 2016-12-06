class CategoriesController < ApplicationController
	def index
		@caregories = Category.all
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
end