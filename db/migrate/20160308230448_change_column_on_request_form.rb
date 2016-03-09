class ChangeColumnOnRequestForm < ActiveRecord::Migration
  def change
  	change_column :requests, :days, :integer, default: 1
  end
end
