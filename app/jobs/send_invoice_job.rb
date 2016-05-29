class SendInvoiceJob < ActiveJob::Base
  queue_as :default


  def perform(invoice)
    @invoice = invoice
    InvoiceMailer.sendinvoice(@invoice).deliver_later
  end
end
