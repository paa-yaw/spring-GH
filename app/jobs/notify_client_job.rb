class NotifyClientJob < ActiveJob::Base
  queue_as :default

  def perform(recipient, security_code, worker)
    @recipient = recipient
    @security_code = security_code
    @worker = worker
    ClientNotifier.clientnotification(@recipient, @security_code, @worker).deliver_later
  end
end
