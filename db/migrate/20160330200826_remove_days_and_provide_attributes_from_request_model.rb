class RemoveDaysAndProvideAttributesFromRequestModel < ActiveRecord::Migration
  def change
  	remove_column :requests, :days, :integer
  	remove_column :requests, :provide, :string
  end
end
