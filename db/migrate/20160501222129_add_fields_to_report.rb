class AddFieldsToReport < ActiveRecord::Migration
  def change
  	add_column :reports, :date, :datetime
  	add_column :reports, :event, :text
  	add_column :reports, :sign, :boolean, default: false
  end
end
