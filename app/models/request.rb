class Request < ActiveRecord::Base
	belongs_to :client

	validates :company, :job_description, :date, :phone_number, :address, presence: true
end
