class AddExtraServicesToRequestForm < ActiveRecord::Migration
  def change
  	add_column :requests, :extra_services, :integer, array: true, default: []
  end
end
