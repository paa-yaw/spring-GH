class Request < ActiveRecord::Base
	belongs_to :client

	validates :name, :job_description, :phone_number, :address, :date_time, presence: true

	scope :excluding_resolved_requests, lambda {where(resolved_at: !nil)}


	def resolve
	  self.update(resolved_at: Time.now)
	end
end
