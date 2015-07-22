module ApplicationHelper
  def full_title(page_title)
    base_title = "Сервисный центр Инфоринг в Ульяновске"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  
	def nav_link(link_text, link_path, options = {})
	  class_name = current_page?(link_path) ? 'active' : ''
    options[:target] = '_top'

	  content_tag(:li, :class => class_name) do
	    link_to link_text, link_path, options
	  end
	end

  def nav_dropdown_link(link_text, link_path, extra)
    return if extra.nil?

    class_name = current_page?(link_path) ? 'dropdown active' : 'dropdown'

    content_tag(:li, :class => class_name) do
      link_to(link_text, link_path, class: "dropdown-toggle", "data-toggle"=>"dropdown") + content_tag(:ul, :class => "dropdown-menu dropdown-menu-left") do
        extra.order('title ASC').collect {|e| concat(content_tag(:li, link_to(e.title, repair_path(e.id))))}
      end
    end
  end

  def nav_modal_link(link_text, modalName)
    content_tag(:li) do
      link_to link_text, '', 'data-toggle' => 'modal', 'data-target' => '#' + modalName + 'Modal'
    end
  end

	def find_price(model, service)
    price = Price.find_by(model_id: model.id, service_id: service.id)
    return price.cost
  end

  def count_tag(count)
    if count == 0 
      "item active"
    else
      "item"
    end
  end

  def col_tag(count)
    "width: #{66.6666666667 / count.length}%"
  end

  def is_root?()
    unless current_page?(root_path)
      render "layouts/web/service/breadcrumbs"
    end
  end

  def bootstrap_class_for flash_type
    "alert-#{flash_type.to_s}"
  end
end
