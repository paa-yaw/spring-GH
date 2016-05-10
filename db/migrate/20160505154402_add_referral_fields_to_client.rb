class AddReferralFieldsToClient < ActiveRecord::Migration
  def change
  	add_column :clients, :referral_code, :string
  	add_column :clients, :referrer_code, :string
  end
end
