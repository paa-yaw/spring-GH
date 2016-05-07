class ReferralsController < ApplicationController
	before_action :set_referral, except: [:new, :create,]
	# before_action :set_client
  
  def show
  end

  def new
    if current_client
  	  @referral = Referral.new
    else
      redirect_to root_path
    end
  end

  def create
  	@referral = Referral.new(referral_params)
  	@referral.sender_id = current_client.id
    @referral.client_id = current_client.id
  	@referral.code = current_client.referral_code
    @url = url_for(:controller => "requests", :action => "new", :host => "springgh.com")
  	if @referral.save
  	  InviteJob.set(wait: 2.seconds).perform_later(@referral, @url)
      flash[:notice] = "You have made an invite"
      redirect_to new_request_path
  	else
  	  flash.now[:alert] = "Your invite failed. try again"
  	  render "new"
  	end
  end


  private

  def set_referral
  	@referral = Referral.find(params[:id])
  rescue ActiveRecord::RecordNotFound
  	redirect_to errors_not_found_path
  end

  # def set_client
  # 	@client = Client.find(params[:client_id])
  # rescue ActiveRecord::RecordNotFound
  # 	redirect_to errors_not_found_path
  # end

  def referral_params
  	params.require(:referral).permit(:sender_id, :recipient_id, :client_id, :email, :code)
  end
end
