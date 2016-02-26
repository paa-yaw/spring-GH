class Request < ActiveRecord::Base
	belongs_to :client
	has_and_belongs_to_many :workers

	validates :provide, :bathrooms, :bedrooms, :kitchens, :hall, :phone_number, :location, :date_time, :frequency, presence: true
    validates_numericality_of :phone_number

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
