class AddLogoToInvoice < ActiveRecord::Migration
  def change
  	# add_column :invoices, :logo, :string
  	remove_column :invoices, :logo, :string
  end
end
