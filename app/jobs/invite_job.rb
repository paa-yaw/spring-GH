class InviteJob < ActiveJob::Base
  queue_as :default

  def perform(referral, url)
    @referral = referral
    @email = @referral.email
    @url = url
    InviteClient.invite(@email, @url).deliver_later
  end
end
