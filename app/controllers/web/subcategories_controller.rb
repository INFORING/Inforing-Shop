class Web::SubcategoriesController < Web::ApplicationController
  skip_authentication

  def show
    @subcategory = Subcategory.find(params[:id])
    @products = @subcategory.products
  end
end