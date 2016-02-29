class AddFieldsToRequestModel < ActiveRecord::Migration
  def change
  	add_column :requests, :bedrooms, :integer, default: 0
  	add_column :requests, :bathrooms, :integer, default: 0
  	add_column :requests, :kitchens, :integer, default: 0
  	add_column :requests, :hall, :integer, default: 0
  	add_column :requests, :provide, :string
  	rename_column :requests, :job_description, :other_task
 	add_column :requests, :days, :integer, default: 0
  end
end
