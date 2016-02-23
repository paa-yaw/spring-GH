class RemoveStartAndTimeFromRequest < ActiveRecord::Migration
  def change
  	remove_column :requests, :start_time, :datetime
  	remove_column :requests, :endtime, :datetime
  	add_column :requests, :category, :string
  end
end
