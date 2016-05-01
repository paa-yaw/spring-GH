class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :worker, index: true, foreign_key: true
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
