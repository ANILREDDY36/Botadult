module ApplicationHelper
	def print_error(obj, field)
    	return if obj[field].blank?
    	"<label id=\"required-error\" class=\"error\" >#{obj[field].uniq.join(', ')}</label>".html_safe
  	end
end
