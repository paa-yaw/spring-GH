class Request < ActiveRecord::Base
	belongs_to :client

	validates :name, :job_description, :phone_number, :address, :date_time, presence: true
end
