class AddResolveFieldToRequest < ActiveRecord::Migration
  def change
  	add_column :requests, :resolved, :boolean, default: false
  end
end
