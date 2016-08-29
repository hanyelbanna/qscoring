module Managers
	class ApplicationController < ActionController::Base
	  protect_from_forgery with: :exception
	  before_action :authenticate_user!
	  before_action :authenticate_manager

	  def authenticate_manager
		  unless current_user.try(:type) == "Managers::Manager"
		  	flash[:alert] = "You are not authorized to access this page."
		  	redirect_to(root_path)
		  end
	  end

	end
end
