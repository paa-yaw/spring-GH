class AddExtraServicesToRequestForm < ActiveRecord::Migration
  def change
  	add_column :requests, :extra_services, :string, array: true, default: []
  end
end
