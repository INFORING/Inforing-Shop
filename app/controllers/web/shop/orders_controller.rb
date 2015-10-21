class Web::Shop::OrdersController < Web::Shop::ApplicationController
  skip_authentication only: [:new, :create]

  def new
    @order = Order.new
  end

  def create
    order = Order.new(order_params)
    if order.valid?
      items = current_cart.order!
      session.delete(:cart)
      order.items = items
      order.status = 0
      order.save
      if signed_in?
        unless current_user.information_present?
          redirect_to order_edit_users_path(id: order.id)
        else
          redirect_to current_user
        end
      else
        redirect_to new_order_registrations_path(id: order.id)
      end
    else
      redirect_to :back
    end
  end

  def update
    order = Order.find(params[:id])
    order.update_attributes(status: 5)
    redirect_to current_user
  end

  private

  def order_params
    params.require(:order).permit( :mail, :full_name, :postcode, :city, :phone, :address, :delivery)
  end
end