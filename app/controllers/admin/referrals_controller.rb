class Admin::ReferralsController < Admin::ApplicationController
  before_action :set_referral, only: [:show]
  before_action :set_client, only: [:show, :view]

  def index
  	@clients = Client.where(admin: false).all.order("points Desc")
  	@referrals = Referral.all
  end

  def show
  end

  def view
  end


  private

  def set_referral
  	@referral = Referral.find(params[:id])
  rescue ActiveRecord::RecordNotFound
  	redirect_to errors_not_found_path
  end

  def set_client
  	@client = Client.find(params[:client_id])
  rescue ActiveRecord::RecordNotFound
  	redirect_to errors_not_found_path
  end


  def referral_params
  	params.require(:referral).permit(:sender_id, :recipient_id, :client_id, :email, :code)
  end

end
