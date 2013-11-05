module ApplicationHelper
	
	def lang_link(link_text, lang)
		class_name = I18n.locale == lang ? 'active' : ''
		#TODO stay in the same route
		content_tag(:li, class: class_name) do 
			link_to url_for(locale: lang) do
				if class_name == 'active'
					(link_text + ' ' + content_tag(:i, "", class: 'icon-ok')).html_safe
				else
					link_text
				end
			end
		end
	end

end
