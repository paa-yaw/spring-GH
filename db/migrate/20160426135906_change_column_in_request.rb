class ChangeColumnInRequest < ActiveRecord::Migration
  def change
  	remove_column :requests, :frequency, :integer
  	add_column :requests, :frequency, :decimal, precision: 12, scale: 5
  end
end
