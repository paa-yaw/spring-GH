class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(client)
    @client = client
    ClientMailer.welcome_email(@client).deliver_later
  end
end
