class InvoiceMailer < ApplicationMailer
  default from: "springgh.com"

   def sendinvoice(invoice)
     @invoice = invoice
     @url = "https://www.springgh.com/clients/sign_in"
	 mail(to: @invoice.recipient_email, subject: "Here is your invoice")
   end
end
