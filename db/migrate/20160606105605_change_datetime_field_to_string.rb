class ChangeDatetimeFieldToString < ActiveRecord::Migration
  def change
  	change_column :requests, :date_time, :string 
  end
end
