class AddColumnsToRequest < ActiveRecord::Migration
  def change
  	add_column :requests, :total_cost, :decimal, precision: 10, scale: 2
  	add_column :requests, :total_rooms, :integer
  	add_column :requests, :extra_services_sum, :decimal, precision: 10, scale: 2
  end
end
