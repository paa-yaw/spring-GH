class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :store_location

  def store_location
  # store last url - this is needed for post-login redirect to whatever the user last visited.
  return unless request.get? 
  if (request.path != "/users/sign_in" &&
    request.path != "/users/sign_up" &&
    request.path != "/users/password/new" &&
    request.path != "/users/password/edit" &&
    request.path != "/users/confirmation" &&
    request.path != "/users/sign_out" &&
      !request.xhr?) # don't store ajax calls
  session[:previous_url] = request.fullpath 
  end
  end


  before_action :configure_permitted_parameters, if: :devise_controller?

   # this code is required for request model to have access to current_client
  def set_current_client
    Client.current = current_client
  end

  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)  << :phone_number
    devise_parameter_sanitizer.for(:sign_up)  << :location
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name


    devise_parameter_sanitizer.for(:account_update) << :phone_number
    devise_parameter_sanitizer.for(:account_update) << :location
    devise_parameter_sanitizer.for(:account_update) << :first_name
    devise_parameter_sanitizer.for(:account_update) << :last_name
  end


  def after_sign_in_path_for(resource)
    if current_client.admin == true
    	admin_root_path
    else
      if current_client.requests.count >= 1
        flash[:notice] = "Welcome back, #{current_client.first_name}! Please place another request."
        session[:previous_url] || new_request_path
      elsif current_client.requests.count == 0
       flash[:notice] = "Welcome, #{current_client.first_name}! Please place a request."
       new_request_path
     else
       new_request_path
     end
   end
 end
end
