class Referral < ActiveRecord::Base
  belongs_to :sender, :class_name => "Client"
  belongs_to :recipient, :class_name => "Client"

  validates :email, uniqueness: {message: "you have already invited this person"}
end
