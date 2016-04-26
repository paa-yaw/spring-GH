class ChangeColumnInRequest < ActiveRecord::Migration
  def change
  	remove_column :requests, :frequency, :integer
  	add_column :requests, :frequency, :decimal, precision: 8, scale: 2
  end
end
