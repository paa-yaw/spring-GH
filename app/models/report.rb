class Report < ActiveRecord::Base
  belongs_to :worker
  belongs_to :client

  validates :date, :event, presence: true
  validate :signature


  def signature
    if sign == false
      errors.add(:sign, "you must tick this option to file your report")
    end	
  end 

end
