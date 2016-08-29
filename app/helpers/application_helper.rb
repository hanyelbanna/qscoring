module ApplicationHelper

# http://pranavprakash.net/2014/10/25/navigation-menu-in-ruby-on-rails/

	# if controller include in the path
	def controller?(*controller)
 		controller.include?(params[:controller])
  	end

 	# if action include in the path
 	def action?(*action)
 		action.include?(params[:action])
 	end

 	# if the same path
 	def activepage?(path)
 		"active" if current_page?(path)
 	end
end
