class NotifyAdminJob < ActiveJob::Base
  queue_as :default

  def perform(recipient, client_name)
    @recipient = recipient
    @client_name = client_name
    AdminNotifier.notification(@recipient, @client_name).deliver_later	
  end
end
