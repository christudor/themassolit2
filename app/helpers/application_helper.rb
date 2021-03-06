 module ApplicationHelper

	def full_title(page_title)
		base_title = "MASSOLIT"
		if page_title.empty?
			base_title
		else "#{base_title} | #{page_title}"
		end
	end

	def display_base_errors resource
	    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
	    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
	    html = <<-HTML
	    <div class="alert alert-error alert-block">
	      <button type="button" class="close" data-dismiss="alert">&#215;</button>
	      #{messages}
	    </div>
	    HTML
	    html.html_safe
  	end

    def is_admin?
      if current_user.rolable_type == "Admin"
        true
      else
        render :text => 'Admins only'
      end
    end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def sortable(column, title = nil)
  	title ||= column.titleize
  	css_class = column == sort_column ? "current #{sort_direction}" : nil
  	direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  	link_to "#{title} <i class='#{direction == "desc" ? "icon-chevron-down" : "icon-chevron-up"}'></i>".html_safe, {:sort => column, :direction => direction}, {:class => css_class}
  end

end
