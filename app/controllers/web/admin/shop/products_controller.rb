class Web::Admin::Shop::ProductsController < Web::Admin::Shop::ApplicationController

  def show
    @product = Product.find(params[:id])
    @features = @product.features_hash
    @new_feature = ProductFeatureForm.new
  end

  def create
    @subcategory = Subcategory.find(params[:id])
    @product = @subcategory.products.build(product_params)
    @product.features_from_subcategory
    @product.save
    redirect_to admin_shop_subcategory_path(@subcategory)
  end


  def update
    @product = Product.find(params[:id])
    @product.update_attributes(product_params)
    redirect_to admin_shop_product_path(@product)
  end

  def destroy
    @product.find(params[:id])
    @subcategory = @product.subcategory
    @product.destroy
    redirect_to admin_shop_subcategory_path(@subcategory)
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :subcategory_id)
  end
end