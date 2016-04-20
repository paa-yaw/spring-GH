class Review < ActiveRecord::Base
  belongs_to :worker
  belongs_to :client
end
