class Web::Admin::Shop::Subcategories::FeaturesController < Web::Admin::Shop::Subcategories::ApplicationController

  def create
    @feature = SubcategoryFeatureForm.new(feature_params)

    if @feature.valid?
      current_subcategory.add_feature(feature_params[:title])
      current_subcategory.save
    end
    redirect_to admin_shop_subcategory_path(current_subcategory)
  end

  def destroy
    current_subcategory.delete_feature(params[:feature])
    current_subcategory.save
    redirect_to admin_shop_subcategory_path(current_subcategory)
  end

  private

  def feature_params
    params.require(:subcategory_feature_form).permit(:title)
  end
end