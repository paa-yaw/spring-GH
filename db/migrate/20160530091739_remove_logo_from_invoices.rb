class RemoveLogoFromInvoices < ActiveRecord::Migration
  def change
  	remove_column :invoices, :logo, :string
  end
end
