class AddPromocodeFieldToRequest < ActiveRecord::Migration
  def change
  	add_column :requests, :promocode, :string
  end
end
