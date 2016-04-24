class Admin::RequestsController < Admin::ApplicationController
  before_action :set_request, only: [:edit, :update, :show, :destroy, :assign, :reopen, :close, :unresolve]	
  before_action :set_client, except: [:assign, :index, :state_of_requests, :reopen, :close, :unresolve]

  def index
    @clients = Client.all.where(admin: false)
    @all_requests = Request.all
  	@requests = Request.all.where(status: "unresolved")
    @resolved_requests= Request.all.where(status: "resolved")
    @requests_without_client = Request.all.where(client_id: nil)
  end

  def show
    @workers = Worker.all
  end

  def new
    @request = @client.requests.build
  end

  def create 
    @request = @client.requests.build(request_params)

    if @request.save
      flash[:notice] = "Request has been created."
      redirect_to [:admin, @client, @request]
    else
      flash.now[:alert] = "Request has not been created."
      render 'new'
    end
  end


  def edit
  end

  def update
    if @request.update(request_params)
      flash[:notice] = "Your request has been updated!"
      redirect_to [:admin, @client, @request]
    else
      flash.now[:alert] = "An update of your request failed!"
      render 'edit'
    end
  end 

 
  def destroy
    @request.destroy
    redirect_to admin_root_path
  end

   def assign
    @worker = Worker.find(params[:worker_id])

    @request.workers << @worker
    @request.resolve 
    @worker.engage
    @security_code = SecureRandom.hex(5)

    @client = @request.client
    NotifyClientJob.set(wait: 2.seconds).perform_later(@client, @security_code)
    flash[:alert] = "You just assigned #{@worker.first_name} to #{@request.id}."

    # redirect_to admin_root_path
    @workers = Worker.all
    render "show"
   end

   def client_requests
    @client_requests = @client.requests
   end

   def reopen
    @request.reopen_request
    @client = @request.client

    # send an email to the client
    ClientNotifyRedoJob.set(wait: 2.seconds).perform_later(@client)
    
    @workers = Worker.all
    render "show"
   end

   def close
    @request.close_request
    @client = @request.client

    # send an email to the client
    ClientNotifyCloseJob.set(wait: 2.seconds).perform_later(@client)
    
    @workers = Worker.all
    render "show"
   end

   def unresolve
    @request.unresolve_request
    @clients = Client.all.where(admin: false)
    @all_requests = Request.all
    @requests = Request.all.where(status: "unresolved")
    @resolved_requests= Request.all.where(status: "resolved")
    @requests_without_client = Request.all.where(client_id: nil)
    render "index"
   end

  
  private

  def set_request
  	@request = Request.find(params[:id]) 
    rescue ActiveRecord::RecordNotFound
     redirect_to errors_not_found_path
  end

  def set_client
    @client = Client.find(params[:client_id])
   rescue ActiveRecord::RecordNotFound
     redirect_to errors_not_found_path
  end

 def request_params
    params.require(:request).permit({:weekdays=>[]}, {:extra_services=>[]}, :date_time, :frequency, :bathrooms, :bedrooms, :hall, :kitchens)
 end

end
