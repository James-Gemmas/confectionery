class CartsController < ApplicationController
  def show
    @cart = session[:cart] || {}
  end

  def update
    product_id = params[:product_id].to_s
    quantity = params[:quantity].to_i
    session[:cart] ||= {}
    if quantity > 0
      session[:cart][product_id] = quantity
    else
      session[:cart].delete(product_id)
    end
    redirect_to cart_path, notice: 'Корзина обновлена'
  end

  def destroy
    session[:cart] = {}
    redirect_to cart_path, notice: 'Корзина очищена'
  end
end