class SendNewsletterJob < ActiveJob::Base
  queue_as :default

  def perform(client, articles)
    @client = client
    @articles = articles
    WeeklyNewsletter.sendnewsletter(@client, @articles).deliver_later
  end
end
