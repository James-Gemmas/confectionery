class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.includes(:order_items)
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.new(delivery_date: params[:delivery_date], status: 'pending')
    total = 0
    (session[:cart] || {}).each do |product_id, quantity|
      product = Product.find(product_id)
      @order.order_items.build(product: product, quantity: quantity, price_at_time: product.price)
      total += product.price * quantity
    end
    @order.total_price = total
    if @order.save
      session[:cart] = {}
      redirect_to orders_path, notice: 'Заказ оформлен!'
    else
      render :new
    end
  end
end