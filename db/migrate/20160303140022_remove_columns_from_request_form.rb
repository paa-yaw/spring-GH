class RemoveColumnsFromRequestForm < ActiveRecord::Migration
  def change
  	remove_column :requests, :other_task, :text
  	remove_column :requests, :phone_number, :string
  	remove_column :requests, :location, :string
  end
end
