class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  
  def index
    @requests = Request.all
  end
  
  def show
  end

  def new
    if current_client
      @request = current_client.request.new
    else
      @request = Request.new
    end
  end

  def create

    if current_client

      @request = current_client.request.new(request_params)

      if @request.save
        flash[:notice] = "Request has been made!"
        redirect_to @request
      else
        flash.now[:alert] = "Your request failed. Please submit it again."
        render 'new'
      end

    else
      @request = Request.new(request_params)

      if @request.save
        flash[:notice] = "Request has been made! Continue to create an account!"
        redirect_to @request
      else
        flash.now[:alert] = "Your request failed. Please submit it again."
        render 'new'
      end
    end

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

  def destroy
    @request.destroy
    flash[:notice] = "request has been deleted."
    redirect_to root_path 
  end

  private   

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:company, :job_description, :date, :time)
  end
end
