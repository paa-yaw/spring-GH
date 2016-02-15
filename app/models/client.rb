class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable


  has_many :requests, dependent: :delete_all 

  # this code is required for request model to have access to current_client
  def self.current
  	Thread.current[:client]
  end

  def self.current=(client)
  	Thread.current[:client] = client
  end

# accepts_nested_attributes_for :requests
end
