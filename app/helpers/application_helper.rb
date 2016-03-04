module ApplicationHelper
	def admins_only(&block)
      block.call if current_client.try(:admin?)
	end
end
