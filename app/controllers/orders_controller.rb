class OrdersController < ApplicationController
  def index
    @orders = Order.order(created_at: :desc)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path
    else
      render :new
    end
  end

  def ready
    @order = Order.find(params[:id])
    @order.mark_ready!
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:customer_phone, :service_type, :notes)
  end
end
