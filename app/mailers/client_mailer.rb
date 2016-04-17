class ClientMailer < ApplicationMailer
  default to: Proc.new{ Client.all.where(admin: false) },
  		  from: "springgh.com" 	

  def welcome_email(client)
  	@client = client
  	@url = "https://springgh.com/clients/sign_in"
  	mail(to: @client.email, subject: "Welcome to Spring")
  end	
end
