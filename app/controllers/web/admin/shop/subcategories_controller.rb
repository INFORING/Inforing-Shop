class Web::Admin::Shop::SubcategoriesController < Web::Admin::Shop::ApplicationController

  def show
    @subcategory = Subcategory.find(params[:id])
    @products = @subcategory.products
    @features = @subcategory.features
    @new_product = Product.new
    @new_feature = SubcategoryFeatureForm.new
  end

  def create
    @category = Category.find(params[:id])
    @category.subcategories.create(subcategory_params)
    redirect_to admin_shop_category_path(@category)
  end


  def update
    @subcategory = Subcategory.find(params[:id])
    @subcategory.update_attributes(subcategory_params)
    redirect_to admin_shop_subcategory_path(@subcategory)
  end

  def destroy
    @subcategory = Subcategory.find(params[:id])
    @category = @subcategory.category
    @subcategory.destroy
    redirect_to admin_shop_category_path(@category)
  end

  private

  def subcategory_params
    params.require(:subcategory).permit(:title, :category_id)
  end
end