class RemovePictureFromArticle < ActiveRecord::Migration
  def change
  	remove_column :articles, :picture, :string
  end
end
