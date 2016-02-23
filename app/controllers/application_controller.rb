class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_action :configure_permitted_parameters, if: :devise_controller?

   # this code is required for request model to have access to current_client
  def set_current_client
    Client.current = current_client
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :fullname
    devise_parameter_sanitizer.for(:account_update) << :fullname
  end


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
