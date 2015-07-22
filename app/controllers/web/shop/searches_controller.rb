class Web::Shop::SearchesController < Web::Shop::ApplicationController
  skip_authentication

  def show
    @products = Product.search params[:query], :star => true
  end
end