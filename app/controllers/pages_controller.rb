class PagesController < ApplicationController
  def home
  	@repairs = Repair.all
    @news = News.last(3)
  end

  def contact
  	@repairs = Repair.all
  	add_breadcrumb "Контакты", :contact_path
    @news = News.last(3)
  end

  def feedback
  	unless params[:name].blank? or params[:email].blank? or params[:text].blank? 
  		Mailer.feedback(params[:name],params[:email],params[:text]).deliver
    end
    respond_to do |format|
    	format.js
    end
  end

  def call
    unless params[:phone].blank?
      Mailer.call(params[:phone]).deliver
    end
    redirect_to root_url
  end
end
