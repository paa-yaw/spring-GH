class Worker < ActiveRecord::Base
  has_and_belongs_to_many :requests 
  

  validates :first_name, :last_name, :sex, :phone_number, :location, :experience,
  :minimum_wage, presence: true 


  def engage
  	self.update(assigned: true)
  end

  def disengage
  	self.update(assigned: false)
  end


end
