class Invoice < ActiveRecord::Base
  belongs_to :request

  mount_uploader :logo, LogoUploader

  validates_format_of :recipient_email,:with => Devise::email_regexp
  validates :invoice_to, :invoice_from, :due_balance, :amount_paid, :logo, presence: true
end
