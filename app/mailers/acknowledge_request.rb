class AcknowledgeRequest < ApplicationMailer
  default from: "springgh.com"

   def acknowledge(client)
     @client = client
     @url = "https://www.springgh.com/clients/sign_in"
	 mail(to: @client.email, subject: "Hi #{@client.first_name},")
   end
end
