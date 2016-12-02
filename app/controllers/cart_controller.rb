class CartController < ApplicationController
  def add
    id = params[:id]
   session[:cart] = {} if !session[:cart]
     cart = session[:cart]
    cart[id] = if cart[id]
                 cart[id] + 1
               else
                 1
               end
    redirect_to action: :index
  end

  def clear
    session[:cart] = nil
    redirect_to action: :index
  end

  def index
    @cart = if session[:cart]
              session[:cart]
            else
              {}
            end
  end
end
