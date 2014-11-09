class PagesController < ApplicationController
  def home
  	@repairs = Repair.all
  end

  def contact
  	@repairs = Repair.all
  	add_breadcrumb "Контакты", :contact_path
  end
<<<<<<< HEAD
=======

  def feedback
  	unless params[:name].blank? or params[:email].blank? or params[:text].blank? 
  		Mailer.feedback(params[:name],params[:email],params[:text]).deliver
    end
    respond_to do |format|
    	format.js
    end
  end
>>>>>>> aa951fd0617d1688f24719ceeafb370905b3d8c2
end
