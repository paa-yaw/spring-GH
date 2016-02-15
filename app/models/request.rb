class Request < ActiveRecord::Base
	belongs_to :client
	has_many :workers

	validates :name, :job_description, :phone_number, :location, :date_time, presence: true

	scope :resolved_requests, lambda {where(resolved: true)}



	def resolve
	  self.update(resolved: true)
	end

	def unresolve
	  self.update(resolved: false)
	end

	def add
	  self.update(client_id: Client.current.id)
	end
end
