class AddFieldsToWorker < ActiveRecord::Migration
  def change
  	add_column :workers, :first_name, :string
  	add_column :workers, :last_name, :string
  	add_column :workers, :sex, :string
  	add_column :workers, :age, :integer
  	add_column :workers, :phone_number, :string
  	add_column :workers, :education, :string
  	add_column :workers, :location, :string
  	add_column :workers, :experience, :text
  	add_column :workers, :minimum_wage, :integer
  	add_column :workers, :email, :string
  	add_column :workers, :extra_info, :text
  end
end
