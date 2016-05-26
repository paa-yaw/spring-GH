class AddStatusToWorkerModel < ActiveRecord::Migration
  def change
  	add_column :workers, :status, :string, default: "not verified"
  end
end
