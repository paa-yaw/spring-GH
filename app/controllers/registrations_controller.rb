class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
  		if current_client.requests.count == 0
  		  flash[:notice] = "#{current_client.email}, welcome to workforce! Please place a request."	
  	      new_request_path
        end  	  	
  end
end