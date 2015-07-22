class Web::Shop::ProductsController < Web::Shop::ApplicationController
  skip_authentication

  def show
    @product = Product.find(params[:id])
  end
end