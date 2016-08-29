class StaticController < ApplicationController
	def homepage
		if user_signed_in?
			if current_user.try(:type) == nil
				redirect_to scorers_score_standards_path
			elsif current_user.try(:type) == "Managers::Validator"
				redirect_to validators_validate_standards_path
			elsif current_user.try(:type) == "Managers::Manager"
				redirect_to managers_manager_dashboards_path
			end			
		end
	end
end