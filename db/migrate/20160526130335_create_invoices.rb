class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.belongs_to :request, index: true

      t.timestamps null: false
    end
  end
end
