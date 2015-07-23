class Web::SearchesController < Web::ApplicationController
  skip_authentication

  def show
    @products = Product.search params[:query], :star => true
  end
end