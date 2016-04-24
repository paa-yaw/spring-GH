class ClientNotifier < ApplicationMailer
   default from: "springgh.com"

   def clientnotification(client, security_code)
     @client = client
     @security_code = security_code
     @url = "https://springgh.com/clients/sign_in"
	 mail(to: @client.email, subject: "A cleaner has just been assigned to you.")
   end
end
