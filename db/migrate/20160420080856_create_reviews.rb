class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :worker, index: true, foreign_key: true
      t.references :client, index: true, foreign_key: true
      t.string :comment
      t.integer :rating

      t.timestamps null: false
    end
  end
end
