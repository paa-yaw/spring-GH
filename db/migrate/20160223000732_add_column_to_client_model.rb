class AddColumnToClientModel < ActiveRecord::Migration
  def change
  	add_column :clients, :fullname, :string
  	remove_column :requests, :name, :string
  	remove_column :requests, :category, :string
  	add_column :requests, :frequency, :string
  end
end
