module ApplicationHelper
	def is_active_controller(controller_name)
		
		if controller_name == "datamanagement"
			["areas","cities", "amenities","rules" ].include?(params[:controller]) ? "active": nil
		elsif controller_name=="reports"
			["users"].include?(params[:controller]) ? "active": nil
		else			
	    params[:controller] == controller_name ? "active" : nil
		end
	end

	def is_active_action(action_name)
	    params[:action] == action_name ? "active" : nil
	end
end
  