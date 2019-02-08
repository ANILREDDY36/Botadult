class ApplicationController < ActionController::Base
	def after_sign_in_path_for(resource)
	    if request.referer == new_user_session_url
	    	user_details_path
	    end
  	end
end
