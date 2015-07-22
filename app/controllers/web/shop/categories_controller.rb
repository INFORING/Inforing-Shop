class Web::Shop::CategoriesController < Web::Shop::ApplicationController
  skip_authentication

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @subcategories = @category.subcategories
  end
end