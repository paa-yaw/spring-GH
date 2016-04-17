class AdminNotifier < ApplicationMailer
  default from: "springgh.com"

  def notification(recipient)
    @recipient = recipient    
  	@url = "https://springgh.com/clients/sign_in"
    mail(to: recipient.email, subject: "Someone just placed a request.")
  end
end
