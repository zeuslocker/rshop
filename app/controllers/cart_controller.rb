class CartController < ApplicationController
  def add
    id = params[:id]
    session[:cart] = {} unless session[:cart]
    cart = session[:cart]
    cart[id] = if cart[id]
                 cart[id] + 1
               else
                 1
               end
    redirect_to action: :index
  end

  def clear
    if !params[:id]
      session[:cart] = nil
      redirect_to action: :index
    else
      session[:cart].delete(params[:id])
      redirect_to action: :index
    end
  end

  def index
    @cart = if session[:cart]
              session[:cart]
            else
              {}
            end
  end
end
