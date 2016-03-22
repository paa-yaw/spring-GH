class AddTagFieldToClient < ActiveRecord::Migration
  def change
  	add_column :clients, :tag, :string, default: "online"
  end
end
