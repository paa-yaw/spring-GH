class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(client, password)
    @client = client
    @password = password
    ClientMailer.welcome_email(@client, @password).deliver_later
  end
end
