class NotifyClientJob < ActiveJob::Base
  queue_as :default

  def perform(recipient, security_code)
    @recipient = recipient
    @security_code = security_code
    ClientNotifier.clientnotification(@recipient, @security_code).deliver_later
  end
end
