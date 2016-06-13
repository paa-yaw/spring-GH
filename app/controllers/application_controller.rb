class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_action :configure_permitted_parameters, if: :devise_controller?

   # this code is required for request model to have access to current_client
  def set_current_client
    Client.current = current_client
  end

  def subscribe
    if current_client
      current_client.subscribe_to_newsletter
      flash[:notice] = "you just subscribed to our weekly newsletter."
      redirect_to articles_path
    else
      flash[:notice] = "you sign up to be able to subscribe to our weekly newsletter."
      redirect_to new_client_registration_path
    end
  end

  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)  << :phone_number
    devise_parameter_sanitizer.for(:sign_up)  << :location
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
    devise_parameter_sanitizer.for(:sign_up) << :points
    devise_parameter_sanitizer.for(:sign_up) << :referrer_code
    devise_parameter_sanitizer.for(:sign_up) << :referral_code


    devise_parameter_sanitizer.for(:account_update) << :phone_number
    devise_parameter_sanitizer.for(:account_update) << :location
    devise_parameter_sanitizer.for(:account_update) << :first_name
    devise_parameter_sanitizer.for(:account_update) << :last_name
    devise_parameter_sanitizer.for(:account_update) << :points
    devise_parameter_sanitizer.for(:account_update) << :referral_code
    devise_parameter_sanitizer.for(:account_update) << :referrer_code
  end


  def after_sign_in_path_for(resource)
    if current_client.admin == true
    	admin_root_path
    else
      if current_client.requests.count >= 1
        flash[:notice] = "Welcome back, #{current_client.first_name}! Please place another request."
        new_request_path
      elsif current_client.requests.count == 0
       flash[:notice] = "Welcome, #{current_client.first_name}! Please place a request."
       new_request_path
     else
       new_request_path
     end
   end
 end
end
