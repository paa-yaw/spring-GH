class Order < ActiveRecord::Base
  validates :bathrooms, :bedrooms, :location, presence: true
  validates :phone_number, format: { with: /\A[-+]?[0-9]*\.?[0-9]+\Z/, message: "only allows numbers" }
  validates_format_of :email,:with => Devise::email_regexp 
end
