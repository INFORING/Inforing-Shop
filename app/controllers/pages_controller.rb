class PagesController < ApplicationController
  def home
  	@repairs = Repair.all
  end

  def contact
  	@repairs = Repair.all
  	add_breadcrumb "Контакты", :contact_path
  end
end
