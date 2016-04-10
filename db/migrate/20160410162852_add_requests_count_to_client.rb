class AddRequestsCountToClient < ActiveRecord::Migration
  def change
  	add_column :clients, :requests_count, :integer
  end
end
