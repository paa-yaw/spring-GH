class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
  		if current_client
  		  flash[:notice] = "#{current_client.email}, welcome to workforce!"	
  	      # new_request_path
  	      display_request_path(Request.last)
        end  	  	
  end
end


