class AddPhotoToWorker < ActiveRecord::Migration
  def change
  	add_column :workers, :photo, :string
  end
end
