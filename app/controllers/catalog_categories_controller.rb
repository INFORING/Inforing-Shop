class CatalogCategoriesController < ApplicationController
	def new
		@category = CatalogCategory.new
		respond_to do |format|
			format.js
		end
	end

	def create 
	 @category = CatalogCategory.new(category_params) 
	 @categories = CatalogCategory.all
   if @category.save
    respond_to do |format|               
      format.js
    end 
   end
	end

	def edit
		@category = CatalogCategory.find(params[:id])
		respond_to do |format|
			format.js
		end
	end

	def update
		@category = CatalogCategory.find(params[:id])
    @category.update_attributes(category_params)
    @categories = CatalogCategory.all
    respond_to do |format|
			format.js
		end
	end

	def destroy
		@category = CatalogCategory.find(params[:id])
		@categories = CatalogCategory.all
		@category.destroy
		respond_to do |format|
			format.js
		end
	end

	def index
		@repairs = Repair.all
    @news = News.last(3)
		@categories = CatalogCategory.all
	end

	def show
		@repairs = Repair.all
    @news = News.last(3)
		@category = CatalogCategory.find(params[:id])
		@items = @category.catalog_items.paginate(page: params[:page], per_page: 10)
	end

	def category_params
      params.require(:catalog_category).permit(:title, :description, :image)
  end
end
