class Web::Shop::CategoriesController < Web::Shop::ApplicationController
  skip_authentication

  def index
    @categories = Category.all
    @products = Product.all
  end

  def show
    @category = Category.find(params[:id])
    @subcategories = @category.subcategories

    render json: @subcategories
  end
end