class Web::ProductsController < Web::ApplicationController
  skip_authentication

  def show
    @product = Product.find(params[:id])
  end
end