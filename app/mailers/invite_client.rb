class InviteClient < ApplicationMailer
	default from: "springgh.com"

	def invite(email, url)
		@email = email
		@url = url
		mail(to: @email, subject: "Dear #{email}, you have been invited to try out spring.")
	end
end
