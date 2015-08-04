class Web::Admin::Shop::Products::ApplicationController < Web::Admin::Shop::ApplicationController
  helper_method :current_product

  private

  def current_product
    @current_product ||= Product.find params[:product_id]
  end
end