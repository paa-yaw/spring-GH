class Request < ActiveRecord::Base
	belongs_to :client

	validates :name, :job_description, :phone_number, :address, :date_time, presence: true

	scope :resolved_requests, lambda {where(resolved: true)}



	def resolve
	  self.update(resolved: true)
	end

	def unresolve
	  self.update(resolved: false)
	end

	def add
	  self.update(client_id: Client.last.id)
	end
end
