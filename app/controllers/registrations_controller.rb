class RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    super
  end

  protected

  def after_sign_up_path_for(resource)
  		if current_client
  		  flash[:notice] = "#{current_client.email}, welcome to Spring!"
        @client_email = current_client.email

  		  # sends email notification to client after sign up 
  	      SendEmailJob.set(wait: 5.seconds).perform_later(@client, nil)

          # sends email notification to admin after client sign up
  	      Client.where(admin: true).each do |recipient|
  	      	NotifyAdminJob.set(wait: 2.seconds).perform_later(recipient, @client_email)
  	      end

  	      # display_request_path(Request.last)
          new_request_path
        end  	  	
  end
end


