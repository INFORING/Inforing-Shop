class Web::Admin::Shop::Subcategories::ApplicationController < Web::Admin::Shop::ApplicationController
  helper_method :current_subcategory

  private

  def current_subcategory
    @current_subcategory ||= Subcategory.find params[:subcategory_id]
  end
end