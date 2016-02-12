class AddDurationAndAreaToRequest < ActiveRecord::Migration
  def change
  	add_column :requests, :start_time, :datetime
  	add_column :requests, :endtime, :datetime
  	rename_column :requests, :address, :location
  end
end
