class ClientNotifyRedoJob < ActiveJob::Base
   queue_as :default

  def perform(recipient)
    @recipient = recipient
    RedoNotifier.redo_request(@recipient).deliver_later
  end
end
