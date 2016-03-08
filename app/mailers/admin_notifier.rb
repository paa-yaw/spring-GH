class AdminNotifier < ApplicationMailer
  default from: "Spring.com"

  

  def notification(recipient)
    @recipient = recipient    
  	@url = "http://workforce16.herokuapp.com/clients/sign_in"
    mail(to: recipient.email, subject: "Someone just placed a request.")
  end
end
