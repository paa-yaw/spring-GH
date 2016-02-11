class AddResolveFieldToRequest < ActiveRecord::Migration
  def change
  	add_column :requests, :resolved_at, :timestamp
  end
end
