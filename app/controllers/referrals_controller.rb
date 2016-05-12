class ReferralsController < ApplicationController
	before_action :set_referral, except: [:new, :create, :index]

  def index
    if current_client
      @referrals = current_client.referrals
    else
      flash[:alert] = "you have no referrals"
      redirect_to new_referral_path
    end
  end
  
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
    # @url = url_for(:controller => "requests", :action => "new", :host => "springgh.com")
  	if @referral.save
  	  InviteJob.set(wait: 2.seconds).perform_later(@referral, new_request_url(:referral_code => @referral.code))
      flash[:notice] = "You have made an invite"
      current_client.spring_points
      redirect_to new_referral_path
  	else
  	  flash.now[:alert] = "Your invite failed. try again"
  	  render "new"
  	end
  end

  def edit
  end

  def update
    if @referral.recipient_id.nil?
      if @referral.update(referral_params)
         # @url = url_for(:controller => "requests", :action => "new", :host => "springgh.com")  
        InviteJob.set(wait: 2.seconds).perform_later(@referral, new_request_url(:referral_code => @referral.code))
        flash[:notice] = "you have sent a follow up invite"
        current_client.spring_points
        redirect_to referrals_path
      else
        flash.now[:alert] = "your invite failed."
        render "edit" 
      end
    else
      flash.now[:alert] = "this person has already been converted."
      redirect_to referrals_path
    end
  end


  private

  def set_referral
  	@referral = Referral.find(params[:id])
  rescue ActiveRecord::RecordNotFound
  	redirect_to errors_not_found_path
  end


  def referral_params
  	params.require(:referral).permit(:sender_id, :recipient_id, :client_id, :email, :code)
  end
end
