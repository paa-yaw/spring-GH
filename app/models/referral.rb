class Referral < ActiveRecord::Base
  belongs_to :sender, :class_name => "Client"
  belongs_to :recipient, :class_name => "Client"
end
