class AddTermsAndConditionsToRequest < ActiveRecord::Migration
  def change
  	add_column :requests, :terms, :boolean, default: false
  end
end
