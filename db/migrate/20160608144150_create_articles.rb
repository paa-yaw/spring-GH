class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :caption
      t.text :content
      t.string :picture
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
