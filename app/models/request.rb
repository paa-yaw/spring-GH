class Request < ActiveRecord::Base
	belongs_to :client
	has_and_belongs_to_many :workers

	validates :days, :provide, :bathrooms, :bedrooms, :kitchens, :hall, :date_time, :frequency, presence: true
    validate :weekday_array_cannot_be_empty

    def weekday_array_cannot_be_empty
      if weekdays==[""]
      	errors.add(:weekdays, "please choose a day")
      end      
    end



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
