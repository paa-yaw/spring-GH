class AddAssignToWorker < ActiveRecord::Migration
  def change
  	add_column :workers, :assigned, :boolean, :default => false
  end
end
