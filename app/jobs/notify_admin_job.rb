class NotifyAdminJob < ActiveJob::Base
  queue_as :default

  def perform(recipient, client)
    @recipient = recipient
    @client = client
    AdminNotifier.notification(@recipient, @client).deliver_later	
  end
end
