class InvoiceMailer < ApplicationMailer
  default from: "springgh.com"

   def sendinvoice(request, invoice)
     @request = request
     @invoice = invoice
     @url = "https://www.springgh.com/clients/sign_in"
	 mail(to: @invoice.recipient_email, subject: "Here is your invoice")
   end
end
