class ChangeDatetimeFieldToString1 < ActiveRecord::Migration
  def change
  	remove_column :requests, :date_time, :string 
  	add_column :requests, :date_time, :string
  end
end
