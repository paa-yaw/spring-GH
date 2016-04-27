class AdminNotifier < ApplicationMailer
  default from: "springgh.com"

  def notification(recipient, client_name)
    @recipient = recipient   
    @client_name = client_name 
  	@url = "https://springgh.com/clients/sign_in"
    mail(to: recipient.email, subject: "Someone just placed a request.")
  end
end
