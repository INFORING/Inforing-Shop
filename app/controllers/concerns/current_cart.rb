module CurrentCart
  extend ActiveSupport::Concern

  included do
    helper_method :current_cart, :destroy_current_cart
  end

  def create_cart
    if session[:cart].nil?
      cart_id = Cart.last.id+1
      session[:cart] = cart_id
      @current_cart ||= Cart.new(cart_id)
    end
  end

  def current_cart
    @current_cart ||= Cart.new(session[:cart]) unless session[:cart].nil?
  end

  def destroy_current_cart
    unless session[:cart].nil?
      current_cart.clean
      session.delete :cart
    end
  end
end