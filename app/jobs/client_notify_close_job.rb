class ClientNotifyCloseJob < ActiveJob::Base
  queue_as :default

  def perform(recipient)
    @recipient = recipient
    CloseNotifier.close_request(@recipient).deliver_later
  end
end
