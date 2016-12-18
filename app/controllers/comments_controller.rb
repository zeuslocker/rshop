class CommentsController < ApplicationController
  before_action :set_product, only: [:create]
  def create
    @comment = @product.comments.create(comment_params.merge(commenter: current_user.email))
    redirect_to product_path(@product)
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
