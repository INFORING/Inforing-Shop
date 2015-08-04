class Web::Shop::CartsController < Web::Shop::ApplicationController
  skip_authentication

  def destroy
    destroy_current_cart
    redirect_to categories_path unless redirect_to :back
  end
end