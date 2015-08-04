class Web::Admin::Shop::Products::FeaturesController < Web::Admin::Shop::Products::ApplicationController

  def create
    @feature_form = ProductFeatureForm.new(feature_params)

    if @feature_form.valid?
      current_product.set_feature(feature_params[:title] => feature_params[:value])
      current_product.save
    end

    redirect_to admin_shop_product_path(current_product)
  end

  def update
    @feature_form = ProductFeatureForm.new(feature_params)

    if @feature_form.valid?
      current_product.set_feature(feature_params[:title] => feature_params[:value])
      current_product.save
    end

    redirect_to admin_shop_product_path(current_product)
  end


  def destroy
    current_product.delete_feature(params[:feature])
    current_product.save
    redirect_to admin_shop_product_path(current_product)
  end

  private

  def feature_params
    params.require(:product_feature_form).permit(:title, :value)
  end
end