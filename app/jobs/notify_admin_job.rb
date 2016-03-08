class NotifyAdminJob < ActiveJob::Base
  queue_as :default

  def perform(recipient)
    @recipient = recipient
    AdminNotifier.notification(@recipient).deliver_later	
  end
end
