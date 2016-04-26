class ChangeColumnToRequest < ActiveRecord::Migration
  def change
  	change_column :requests, :frequency, :decimal, precision: 6, scale: 2
  end
end
