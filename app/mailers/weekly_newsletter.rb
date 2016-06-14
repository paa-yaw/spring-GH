class WeeklyNewsletter < ApplicationMailer
  default from: "springgh.com"

  def sendnewsletter(client, articles)
    @client = client
    @articles = articles
  	@url = "https://www.springgh.com/clients/sign_in"
    mail(to: @client.email, subject: "Spring Weekly Newsletter.")
  end
end
