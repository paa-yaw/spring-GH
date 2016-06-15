class AddTermsToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :terms, :boolean, default: false
  end
end
