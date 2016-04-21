class Worker < ActiveRecord::Base
  has_and_belongs_to_many :requests 
  has_many :reviews, dependent: :destroy
  

  validates :first_name, :last_name, :sex, :phone_number, :location, :experience,
  :minimum_wage, presence: true 


  def engage
  	self.update(assigned: true)
  end

  def disengage
  	self.update(assigned: false)
  end
  
  def average_rating
  	reviews.sum(:rating) / reviews.size
  end
end
