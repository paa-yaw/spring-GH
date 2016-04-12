class Request < ActiveRecord::Base
	belongs_to :client, counter_cache: true
	has_and_belongs_to_many :workers

	validates :bathrooms, :bedrooms, :kitchens, :hall, :date_time, :frequency, presence: true
    validate :weekday_array_cannot_be_empty
    validate :restrict_selection

    def weekday_array_cannot_be_empty
      if weekdays == [""]
      	errors.add(:weekdays, "please choose a day")
      end      
    end

    def restrict_selection
      if frequency == 60 && weekdays.length > 2
      	errors.add(:weekdays, "You can only choose one day for One-Off package")
      elsif frequency == 150 && weekdays.length > 4
      	errors.add(:weekdays, "You can't choose more than 3 days for weekly package.")
      elsif frequency ==500 && weekdays.length > 4
      	errors.add(:weekdays, "You can't choose more than 3 days for Monthly package")
      end
    end



	scope :resolved_requests, lambda {where(resolved: true)}
  


	def resolve
	  self.update(resolved: true)
	  self.update(status: "resolved")
	end

	def unresolve
	  self.update(resolved: false)
	end

	def close_request
	  self.update(status: "done")
	end

	def reopen_request
	  self.update(status:"redo")
	end

	def add
	  self.update(client_id: Client.current.id)
	end
	
end
