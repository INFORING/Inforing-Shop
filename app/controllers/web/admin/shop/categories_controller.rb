class Web::Admin::Shop::CategoriesController < Web::Admin::Shop::ApplicationController
  def index
    @categories = Category.all
    @new_category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @subcategories = @category.subcategories
    @new_subcategory = Subcategory.new
  end

  def create
    Category.create(category_params)
    redirect_to action: :index
  end


  def update
    @category = Category.find(params[:id])
    @category.update_attributes(category_params)
    redirect_to admin_shop_category_path(@category)
  end

  def destroy
    @category.find(params[:id]).destroy
    redirect_to action: :index
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end