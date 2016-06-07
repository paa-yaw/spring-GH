class RenameAndAddFieldsToRequest < ActiveRecord::Migration
  def change
  	rename_column :requests, :date_time, :date
  	add_column :requests, :time, :datetime
  end
end
