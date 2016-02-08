class AddClientRefToRequests < ActiveRecord::Migration
  def change
    add_reference :requests, :client, index: true, foreign_key: true
  end
end
