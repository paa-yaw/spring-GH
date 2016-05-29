class SendInvoiceJob < ActiveJob::Base
  queue_as :default


  def perform(request, invoice)
    @request = request
    @invoice = invoice
    InvoiceMailer.sendinvoice(@request, @invoice).deliver_later
  end
end
