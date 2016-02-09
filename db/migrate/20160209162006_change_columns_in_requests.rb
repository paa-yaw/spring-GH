class ChangeColumnsInRequests < ActiveRecord::Migration
  def change
  	remove_column :requests, :date, :string
  	remove_column :requests, :time, :string
  	add_column :requests, :date, :datetime
  	add_column :requests, :phone_number, :string
  	add_column :requests, :address, :string
  end
end
