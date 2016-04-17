class ClientNotifyRedoJob < ActiveJob::Base
   queue_as :default

  def perform(client)
    @client = client
    RedoNotifier.redo_request(@client).deliver_now
  end
end
