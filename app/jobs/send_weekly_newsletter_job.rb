class SendWeeklyNewsletterJob < ActiveJob::Base
   queue_as :default


  def perform(client)
    @client = client
    WeeklyNewsletter.sendnewsletter(@client).deliver_later
  end
end
