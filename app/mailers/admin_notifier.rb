class AdminNotifier < ApplicationMailer
  default from: "springgh.com"

  def notification(recipient, client)
    @recipient = recipient   
    @client = client
  	@url = "https://springgh.com/clients/sign_in"
    mail(to: recipient.email, subject: "#{@client.first_name || @client.email} just placed a request.")
  end
end
