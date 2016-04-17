class ClientNotifier < ApplicationMailer
   default from: "springgh.com"

   def clientnotification(client)
     @client = client
     @url = "https://springgh.com/clients/sign_in"
	 mail(to: @client.email, subject: "A cleaner has just been assigned to you.")
   end
end
