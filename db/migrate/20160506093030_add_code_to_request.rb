class AddCodeToRequest < ActiveRecord::Migration
  def change
  	add_column :requests, :ref_code, :string
  end
end
