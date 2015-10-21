class Web::Admin::Shop::OrdersController < Web::Admin::Shop::ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @cart = @order.cart
  end

  def update
    redirect_to :back if Order.find(params[:id]).update_attributes(order_params)
  end

  def destroy
    Order.find(params[:id]).destroy
    redirect_to admin_shop_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end