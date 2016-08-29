module Validators
	class ApplicationController < ActionController::Base
	  protect_from_forgery with: :exception
	  before_action :authenticate_user!
	  before_action :authenticate_validator

	  def authenticate_validator
		  unless current_user.try(:type) == "Managers::Validator"
		  	flash[:alert] = "You are not authorized to access this page."
		  	redirect_to(root_path)
		  end
	  end

	end
end
