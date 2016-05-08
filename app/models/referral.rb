class Referral < ActiveRecord::Base
  belongs_to :sender, :class_name => "Client"
  belongs_to :recipient, :class_name => "Client"
  
  validates_format_of :email,:with => Devise::email_regexp, allow_blank: true
  validates :email, uniqueness: {message: "you have already invited this person"}
end
