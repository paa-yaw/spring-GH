class AddFieldsToRequestModel < ActiveRecord::Migration
  def change
  	add_column :requests, :bedrooms, :integer
  	add_column :requests, :bathrooms, :integer
  	add_column :requests, :kitchens, :integer
  	add_column :requests, :hall, :integer
  end
end
