class AddPointsToClient < ActiveRecord::Migration
  def change
  	add_column :clients, :points, :integer, default: 0
  end
end
