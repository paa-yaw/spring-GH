class CreateJoinTable < ActiveRecord::Migration
  def change
  	remove_column :workers, :request_id, :integer

  	create_table :requests_workers, id: false do |t|
  	  t.belongs_to :request, index: true
  	  t.belongs_to :worker, index: true
  	end
  end
end
