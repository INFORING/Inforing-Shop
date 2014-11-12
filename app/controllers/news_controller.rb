class NewsController < ApplicationController
	def new
		@new_news = News.new
		respond_to do |format|
			format.js
		end
	end

	def create
		@news = News.all
		@new_news = News.create(news_params)
		if @new_news.save
			respond_to do |format|
				format.js
			end
		end
	end

	def show
		@show_news = News.find(params[:id])
		@news = News.all
		@repairs = Repair.all
	end

	def index
		@news = News.all
		@repairs = Repair.all
	end

	def edit
		@edit_news = News.find(params[:id])
		respond_to do |format|
			format.js
		end
	end

	def update
		@news = News.all
		@edit_news = News.find(params[:id])
		if @edit_news.update_attributes(news_params)
			respond_to do |format|
				format.js
			end
		end
	end

	def destroy
		@news = News.all
		@destroy_news = News.find(params[:id])
		@destroy_news.destroy
		respond_to do |format|
			format.js
		end
	end

	private

	def news_params
		params.require(:news).permit(:title, :description,:tags,:image)	
	end
end
