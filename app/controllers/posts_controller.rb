class PostsController < ApplicationController
	def new
	end
  
  def create
  end

  def update
  end

  private
  	def item_params
      params.require(:item).permit(:title, :repair_id)
  	end
end
