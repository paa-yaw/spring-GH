class AddWeekdaysToRequest < ActiveRecord::Migration
  def change
  	add_column :requests, :weekdays, :text, array: true, default: []
  end
end
