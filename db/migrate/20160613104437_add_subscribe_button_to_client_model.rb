class AddSubscribeButtonToClientModel < ActiveRecord::Migration
  def change
  	add_column :clients, :subscribe, :boolean, default: false
  end
end
