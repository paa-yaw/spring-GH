class AddFieldsToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :email, :string
    add_column :requests, :phone_number, :string
    add_column :requests, :location, :string
  end
end
