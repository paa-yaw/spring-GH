class Worker < ActiveRecord::Base
  has_and_belongs_to_many :requests
    # attr_accessor :request_id 
  

  validates :first_name, :last_name, :sex, :phone_number, :location, :experience,
  :minimum_wage, presence: true 


end
