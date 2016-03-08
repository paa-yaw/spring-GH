class ClientMailer < ApplicationMailer
  default to: Proc.new{ Client.all.where(admin: false) },
  		  from: "Spring.com" 	

  def welcome_email(client)
  	@client = client
  	@url = "http://workforce16.herokuapp.com/clients/sign_in"
  	mail(to: @client.email, subject: "Welcome to Spring")
  end	
end
