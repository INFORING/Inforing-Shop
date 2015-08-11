class Web::Shop::ProductsController < Web::Shop::ApplicationController
  skip_authentication

  def index
    @products = Product.all
    render json: @products
  end

  def show
    @product = Product.find(params[:id])
  end

  def index_by_category
    @category = Category.find(params[:id])
    render json: @category.products
  end

  def index_by_subcategory
    @subcategory = Subcategory.find(params[:id])
    render json: @subcategory.products
  end
end