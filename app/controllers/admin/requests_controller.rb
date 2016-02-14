class Admin::RequestsController < Admin::ApplicationController
  before_action :set_request, only: [:show, :resolve, :unresolve]	

  def index
    @all_requests = Request.all
  	@requests = Request.all.where(resolved: false)
    @resolved_requests= Request.all.where(resolved: true)
  end

  def show
  end

  def resolve
  	@request.resolve
    
    if @request.save 
  	  flash[:notice] = "This request has been resolved."
  	  redirect_to :controller => 'admin/workers', :action => 'index', :request_id => params[:id]
    else
      admin_root_path
    end
  end

  def unresolve
    @request.unresolve

    flash[:notice] = "This request has not been resolved"
    redirect_to admin_root_path
  end

  private

  def set_request
  	@request = Request.find(params[:id]) 
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "can find the resource you are looking for!"
    redirect_to admin_root_path
  end
end
