class ChangeColumnsInRequests < ActiveRecord::Migration
  def change
  	remove_column :requests, :date, :string
  	remove_column :requests, :time, :string
  	add_column :requests, :date, :datetime
  	add_column :requests, :phone_number, :string
  	add_column :requests, :address, :string
  	remove_column :requests, :company, :string
  	add_column :requests, :name, :string
  	add_column :requests, :date_time, :datetime
  end
end
