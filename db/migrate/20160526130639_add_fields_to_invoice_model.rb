class AddFieldsToInvoiceModel < ActiveRecord::Migration
  def change
  	add_column :invoices, :invoice_to, :string
  	add_column :invoices, :invoice_from, :string
  	add_column :invoices, :due_date, :datetime
  	add_column :invoices, :date_issue, :datetime
  	add_column :invoices, :due_balance, :decimal, precision: 6, scale: 2
  	add_column :invoices, :amount_paid, :decimal, precision: 6, scale: 2
  	add_column :invoices, :rooms, :integer
  	add_column :invoices, :extra_services, :decimal, array: true, default: []
  	add_column :invoices, :package, :decimal, precision: 6, scale: 2
  	add_column :invoices, :total_amount, :decimal, precision: 6, scale: 2
  	add_column :invoices, :recipient_email, :string
  end
end
