class AddAdminFieldToClient < ActiveRecord::Migration
  def change
  	add_column :clients, :admin, :boolean, default: false
  end
end
