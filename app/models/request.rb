class Request < ActiveRecord::Base
	belongs_to :client, counter_cache: true
	has_and_belongs_to_many :workers

	validates :bathrooms, :bedrooms, :kitchens, :hall, :date_time, :frequency, presence: true
  validate :weekday_array_cannot_be_empty
  validate :restrict_selection
  validate :forbidden_dates
  validate :day_and_date_match

    def weekday_array_cannot_be_empty
      if weekdays == [""]
      	errors.add(:weekdays, "please choose a day")
      end      
    end

    def restrict_selection
      if frequency == 150.00 && weekdays.length > 2
      	errors.add(:weekdays, "You can only choose one day for Deep-Cleaning package")
      elsif frequency == 150.01 && weekdays.length > 4
      	errors.add(:weekdays, "You can't choose more than 3 days for weekly package.")
      elsif frequency ==500.00 && weekdays.length > 4
      	errors.add(:weekdays, "You can't choose more than 3 days for Monthly package")
      end
    end

    def forbidden_dates
      if date_time.year == Time.now.year && date_time.month < Time.now.month
      	errors.add(:date_time, "Can't choose a month in the past")
      elsif date_time.year == Time.now.year && date_time.month == Time.now.month && date_time.day == Time.now.day 
        errors.add(:date_time, "you cannot schedule for today. Please book from tomorrow onwards.")   
      elsif date_time.year == Time.now.year && date_time.month > Time.now.month + 3
      	errors.add(:date_time, "Can't choose a month beyond 3 months from now.")      		
      elsif date_time.year == Time.now.year && date_time.month == Time.now.month && date_time.day < Time.now.day
      	errors.add(:date_time, "Can't choose a day in the past.")
      elsif  date_time.year == Time.now.year && (date_time.month == Time.now.month || date_time.day == Time.now.day) && (date_time.hour < 6 || date_time.hour > 17)
      	errors.add(:date_time, "service is not available at this time. Choose a time between 6am & 5pm")
      elsif  date_time.year == Time.now.year && (date_time.hour < 6 || date_time.hour > 17)
      	errors.add(:date_time, "service is not available at this time. Choose a time between 6am & 5pm")
      elsif date_time.day == Time.now.day && date_time.year == Time.now.year && date_time.month == Time.now.month && (date_time.hour > 6 && date_time.hour < 17)
        errors.add(:date_time, "can't choose time in the past.") if date_time.hour < Time.now.hour		
      elsif date_time.year == Time.now.year + 1 && date_time.month < 10
      	errors.add(:date_time, "the date selected is too far off")
      elsif date_time.year == Time.now.year + 1
      	errors.add(:date_time, "the date selected is too far off")	      			      		
      end
    end

    def day_and_date_match
      if frequency == 150.00 
        if weekdays[0] != date_time.strftime("%A") && date_time.year == Time.now.year && date_time.month == Time.now.month
          errors.add(:date_time, ": #{date_time.day.ordinalize} is a #{date_time.strftime("%A")}, 
            but you choose #{weekdays[0]} ")
        end
      end
    end




	scope :resolved_requests, lambda {where(status: "resolved")}
  


	def resolve
	  self.update(status: "resolved")
	end


	def close_request
	  self.update(status: "done")
	end

	def reopen_request
	  self.update(status:"redo")
	end

  def unresolve_request
    self.update(status: "unresolved")
  end


	def add
	  self.update(client_id: Client.current.id)
	end
	
end
