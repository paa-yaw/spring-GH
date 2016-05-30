class Invoice < ActiveRecord::Base
  belongs_to :request

  validates_format_of :recipient_email,:with => Devise::email_regexp
  validates :invoice_to, :invoice_from, :due_balance, :amount_paid,  presence: true
end
