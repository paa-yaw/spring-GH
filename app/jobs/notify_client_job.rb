class NotifyClientJob < ActiveJob::Base
  queue_as :default

  def perform(recipient)
    @recipient = recipient
    ClientNotifier.clientnotification(@recipient).deliver_later
  end
end
