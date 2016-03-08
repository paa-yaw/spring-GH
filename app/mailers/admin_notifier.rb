class AdminNotifier < ApplicationMailer
  default from: "Spring.com"

  

  def notification(recipient)
    @recipient = recipient    
  	@url = "http://127.0.0.1:3000/clients/sign_in"
    mail(to: recipient.email, subject: "Someone just placed a request.")
  end
end
