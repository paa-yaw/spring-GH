class RedoNotifier < ApplicationMailer
   default from: "springgh.com"

   def redo_request(client)
     @client = client
     @url = "https://springgh.com/clients/sign_in"
	 mail(to: @client.email, subject: "Your request has been re-assigned.")
   end
end
