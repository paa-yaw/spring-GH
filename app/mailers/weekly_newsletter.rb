class WeeklyNewsletter < ApplicationMailer
  default from: "springgh.com"

   def sendnewsletter(client)
     @client = client
     @url = "https://www.springgh.com/clients/sign_in"
	 mail(to: @client.email, subject: "Your Weekly Spring Newsletter")
   end
end
