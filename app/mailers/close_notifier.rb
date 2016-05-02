class CloseNotifier < ApplicationMailer
   default from: "springgh.com"

   def close_request(client)
     @client = client
     @url = "https://www.springgh.com/clients/sign_in"
	 mail(to: @client.email, subject: "Your request has been closed.")
   end
end
