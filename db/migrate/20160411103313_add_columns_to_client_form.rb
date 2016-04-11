class AddColumnsToClientForm < ActiveRecord::Migration
  def change
  	add_column :clients, :first_name, :string
  	add_column :clients, :last_name, :string
  	remove_column :clients, :fullname, :string
  end
end
