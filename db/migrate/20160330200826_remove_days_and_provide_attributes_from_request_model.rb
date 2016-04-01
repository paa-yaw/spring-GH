class RemoveDaysAndProvideAttributesFromRequestModel < ActiveRecord::Migration
  def change
  	remove_column :requests, :days, :integer
  	remove_column :requests, :provide, :string
  	
  	remove_column :requests, :frequency, :string
  	add_column :requests, :frequency, :integer

  	remove_column :requests, :extra_services, :integer
  	add_column :requests, :extra_services, :integer
  end
end
