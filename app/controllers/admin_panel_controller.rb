class AdminPanelController < ApplicationController
  before_action :authenticate_admin!
  def index; end

  def products
    @products = Product.all
  end
end
