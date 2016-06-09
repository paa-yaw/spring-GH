class AddCaptionPhotoToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :caption_photo, :string
  end
end
