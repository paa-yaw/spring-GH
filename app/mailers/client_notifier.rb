class ClientNotifier < ApplicationMailer
   default from: "Spring.com"

   def clientnotification(client)
     @client = client
     @url = "http://workforce16.herokuapp.com/clients/sign_in"
	 mail(to: @client.email, subject: "A cleaner has just been assigned to you.")
   end
end
