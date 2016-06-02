class SendAcknowledgementJob < ActiveJob::Base
  queue_as :default

  def perform(client)
    @client = client
    AcknowledgeRequest.acknowledge(@client).deliver_later
  end
end
