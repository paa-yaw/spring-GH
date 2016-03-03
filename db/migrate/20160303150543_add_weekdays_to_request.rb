class AddWeekdaysToRequest < ActiveRecord::Migration
  def change
  	add_column :requests, :weekdays, :string, array: true, default: nil
  end
end
