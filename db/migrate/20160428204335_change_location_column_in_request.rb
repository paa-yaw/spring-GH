class ChangeLocationColumnInRequest < ActiveRecord::Migration
  def change
  	change_column :requests, :location, :text
  end
end
