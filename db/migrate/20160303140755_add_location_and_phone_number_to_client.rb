class AddLocationAndPhoneNumberToClient < ActiveRecord::Migration
  def change
  	add_column :clients, :location, :string
  	add_column :clients, :phone_number, :string
  end
end
