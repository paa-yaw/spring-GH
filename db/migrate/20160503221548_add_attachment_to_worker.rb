class AddAttachmentToWorker < ActiveRecord::Migration
  def change
    add_column :workers, :attachment, :string	
  end
end
