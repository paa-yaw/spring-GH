class AddRequestDetailsToRequest < ActiveRecord::Migration
  def change
  	add_column :requests, :company, :string
  	add_column :requests, :job_description, :text
    add_column :requests, :date, :string
    add_column :requests, :time, :string 
  end
end
