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

  def repair_computer
    redirect_to repair_path(3)
  end

  def repair_print
    redirect_to repair_path(7)
  end

  def repair_apple
    redirect_to repair_path(2)
  end

  def repair_mobile
    redirect_to repair_path(2)
  end

  def repair_game
    redirect_to repair_path(6)
  end

  def repair_notebook
    redirect_to repair_path(4)
  end

  def repair_tablet
    redirect_to repair_path(5)
  end
end
