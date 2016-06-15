class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :bedrooms
      t.integer :bathrooms
      t.string :email
      t.string :phone_number
      t.text :location

      t.timestamps null: false
    end
  end
end
