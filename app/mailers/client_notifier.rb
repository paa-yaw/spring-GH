class ClientNotifier < ApplicationMailer
   default from: "springgh.com"

   def clientnotification(client, security_code, worker)
     @client = client
     @security_code = security_code
     @worker = worker
     @url = "https://www.springgh.com/clients/sign_in"
	 mail(to: @client.email, subject: "A cleaner has just been assigned to you.")
   end
end
