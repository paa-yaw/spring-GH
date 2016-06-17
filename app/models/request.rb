class Request < ActiveRecord::Base
	belongs_to :client, counter_cache: true
	has_and_belongs_to_many :workers
  has_one :invoice, dependent: :destroy

  # after_create :convert_string_date_to_date

	validates :bathrooms, :bedrooms, :kitchens, :hall, :date, :frequency, presence: true
  validates :phone_number, format: { with: /\A[-+]?[0-9]*\.?[0-9]+\Z/, message: "only allows numbers" }, allow_blank: true
  validates_format_of :email,:with => Devise::email_regexp, allow_blank: true
  validate :terms_of_service
  validate :weekday_array_cannot_be_empty
  # validate :restrict_selection
  # validate :forbidden_dates
  # validate :day_and_date_match
  validate :length_of_phone_number
  validate :choose_at_least_one_room

  def choose_at_least_one_room
    if bathrooms == 0 && bedrooms == 0 && hall == 0 && kitchens == 0
      errors.add(:bathrooms, "please choose at least one room")
    end
  end

    def length_of_phone_number
      if phone_number.present?
        if phone_number.length != 10
          errors.add(:phone_number, "please make sure your phone number has the correct number of digits")
        end
      end        
    end

    def weekday_array_cannot_be_empty
      if frequency == 150.00
      elsif frequency == 200.00 || frequency == 500.00
        if weekdays == [""]
        	errors.add(:weekdays, "please choose a day")
        end  
      end    
    end

    def restrict_selection
      # if frequency == 150.00 && weekdays.length > 2
      # 	errors.add(:weekdays, "You can only choose one day for Deep-Cleaning package")
      if frequency == 200.00 && weekdays.length > 4
      	errors.add(:weekdays, "You can't choose more than 3 days for weekly package.")
      elsif frequency ==500.00 && weekdays.length > 4
      	errors.add(:weekdays, "You can't choose more than 3 days for Monthly package")
      end
    end

    def forbidden_dates
       date = self.date.to_date
      if date.year == Time.now.year && date.month < Time.now.month
      	errors.add(:date, ": Can't choose a month in the past")
      elsif date.year == Time.now.year && date.month == Time.now.month && date.day == Time.now.day 
        errors.add(:date, ": you cannot schedule for today. Please book from tomorrow onwards.")   
      elsif date.year == Time.now.year && date.month > Time.now.month + 3
      	errors.add(:date, ": Can't choose a month beyond 3 months from now.")      		
      elsif date.year == Time.now.year && date.month == Time.now.month && date.day < Time.now.day
      	errors.add(:date, ": Can't choose a day in the past.")
      # elsif  date.year == Time.now.year && (date.month == Time.now.month || date.day == Time.now.day) && (date.hour < 6 || date.hour > 17)
      # 	errors.add(:date, ": service is not available at this time. Choose a time between 6am & 5pm")
      # elsif  date.year == Time.now.year && (date.hour < 6 || date.hour > 17)
      # 	errors.add(:date, ": service is not available at this time. Choose a time between 6am & 5pm")
      # elsif date.day == Time.now.day && date.year == Time.now.year && date.month == Time.now.month && (date.hour > 6 && date.hour < 17)
      #   errors.add(:date, "can't choose time in the past.") if date.hour < Time.now.hour		
      elsif date.year == Time.now.year + 1 && date.month < 10
      	errors.add(:date, ": the date selected is too far off")
      elsif date.year == Time.now.year + 1
      	errors.add(:date, ": the date selected is too far off")	      			      		
      end
    end

    # def day_and_date_match
    #   if frequency == 150.00
    #   elsif frequency == 200.00 && weekdays.exclude?(date.strftime("%A")) && date.year == Time.now.year 
    #       errors.add(:date, ": #{date.day.ordinalize} is a #{date.strftime("%A")}. Please choose a day that
    #         corresponds with one of the selected days")
    #   elsif frequency == 500.00 &&  weekdays.exclude?(date.strftime("%A")) && date.year == Time.now.year 
    #       errors.add(:date, ": #{date.day.ordinalize} is a #{date.strftime("%A")}. Please choose a day that
    #         corresponds with one of the selected days")  
    #   end
    # end

    def terms_of_service
      if terms == false
        errors.add(:terms, "you have to agree to our terms before you proceed.")
      end
    end

   

    def business_algorithm
       rooms = self.bedrooms + self.bathrooms + self.hall + self.kitchens
       extra_services = 0
       a = self.extra_services.length.to_i - 1 

       for i in 0...a
         extra_services += self.extra_services[i].to_i 
       end

       one_off_package = 150.00
       weekly_package = 200.00
       monthly_package = 500.00

       if self.frequency == one_off_package
        total = one_off_package + rooms*5 + extra_services
        total = total.round
        if self.promocode == "mothersday2016"
         discount = total * 0.85
         discount = discount.round
         write_attribute(:total_cost, discount)
         save
        else            
          write_attribute(:total_cost, total)
          write_attribute(:total_rooms, rooms)
          save
        end

       elsif self.frequency == weekly_package
        total = weekly_package + rooms*5 + extra_services
        total = total.round
        if self.promocode == "mothersday2016"
          discount = total * 0.85
          discount = discount.round
          write_attribute(:total_cost, discount)
          save
        else
          total = weekly_package + rooms*5 + extra_services
          total = total.round
          write_attribute(:total_cost, total)
          write_attribute(:total_rooms, rooms)
          save
        end

       elsif self.frequency == monthly_package
         if rooms > 8
          total = monthly_package + (rooms - 8)*5 + extra_services
          totat = total.round
            if self.promocode == "mothersday2016"
              discount = total * 0.85
              discount = discount.round
              write_attribute(:total_cost, discount)
              save
            else
              write_attribute(:total_cost, total)
              write_attribute(:total_rooms, rooms)
              save
            end
         elsif rooms <= 8
         total = monthly_package + extra_services
         total = total.round
           if self.promocode == "mothersday2016"
              discount = total * 0.85
              discount = discount.round
              write_attribute(:total_cost, discount)
              save
           else
             write_attribute(:total_cost, total)
             write_attribute(:total_rooms, rooms)
             save
           end
         end                              
       end 
    end


    







	scope :resolved_requests, lambda {where(status: "resolved")}
  


	def resolve
	  self.update(status: "resolved")
    save
	end


	def close_request
	  self.update(status: "done")
    save
	end

	def reopen_request
	  self.update(status:"redo")
    save
	end

  def unresolve_request
    self.update(status: "unresolved")
    save
  end


	# def add
	#   self.update(client_id: Client.current.id)
	# end

  # private

  # def convert_string_date_to_date
  #   self.date = self.date.to_date
  # end

	
end
