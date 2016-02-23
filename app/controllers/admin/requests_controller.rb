class Admin::RequestsController < Admin::ApplicationController
  before_action :set_request, only: [:edit, :show, :resolve, :unresolve, :destroy, :assign]	

  def index
    @all_requests = Request.all
  	@requests = Request.all.where(resolved: false)
    @resolved_requests= Request.all.where(resolved: true)
  end

  def show
    @workers = Worker.all
  end

  def edit
  end

  def update
    if @request.update(request_params)
      flash[:notice] = "Your request has been updated!"
      redirect_to @request
    else
      flash.now[:alert] = "An update of your request failed!"
      render 'edit'
    end
  end 

  def assign
    @worker = Worker.find(params[:worker_id])

    @request.workers << @worker
    @request.resolve 
    flash[:alert] = "You just assigned #{@worker.first_name} to #{@request.job_description}."

    redirect_to admin_root_path
  end

  # def resolve
  # 	@request.resolve
    
  #   if @request.save 
  # 	  flash[:notice] = "This request has been resolved."
  #     redirect_to admin_workers_path
  #   else
  #     admin_root_path
  #   end
  # end

  def unresolve
    @request.unresolve

    flash[:notice] = "This request has not been resolved"
    redirect_to admin_root_path
  end

  def destroy
    @request.destroy
    redirect_to admin_root_path
  end

  private

  def set_request
  	@request = Request.find(params[:id]) 
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "can find the resource you are looking for!"
    redirect_to admin_root_path
  end

  def request_params
    params.require(:request).permit(:category, :job_description, :phone_number, :location, :date_time)
  end
end
