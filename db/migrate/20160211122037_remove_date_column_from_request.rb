class RemoveDateColumnFromRequest < ActiveRecord::Migration
  def change
  	remove_column :requests, :date, :datetime
  end
end
