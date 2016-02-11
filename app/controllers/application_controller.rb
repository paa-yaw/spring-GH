class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource)
    if current_client.admin == true
    	admin_requests_path
    else
 	  if current_client.requests.count >= 1
 	    flash[:notice] = "Welcome back, #{current_client.email}! Please place another request."
 		new_request_path
 	  elsif current_client.requests.count == 0
 		flash[:notice] = "Welcome, #{current_client.email}! Please place a request."
 		new_request_path
 	  else
 		new_request_path
 	  end
    end
  end
end
