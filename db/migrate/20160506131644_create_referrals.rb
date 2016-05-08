class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.string :code
      t.string :email
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
