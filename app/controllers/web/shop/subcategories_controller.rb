class Web::Shop::SubcategoriesController < Web::Shop::ApplicationController
  skip_authentication

  def show
    @subcategory = Subcategory.find(params[:id])
    @products = @subcategory.products
  end
end