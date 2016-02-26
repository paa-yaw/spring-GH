class RequestsController < ApplicationController
  # before_filter :require_client
  # this code is required for request model to have access to current_client
  before_filter :set_current_client
  before_action :set_request, only: [:show, :edit, :update, :destroy, :add, :display_request]

  def index
    @requests = Request.all
  end
  
  def show
  end

  def new

    if current_client
      @request = current_client.requests.new
    else
      @request = Request.new
    end
  end

  def create


    if current_client

      @request = current_client.requests.new(request_params)

      if @request.save
        flash[:notice] = "#{current_client.email}, your request has been made!"
        redirect_to display_request_path(@request)
      else
        flash.now[:alert] = "Your request failed. Please submit it again."
        render 'new'
      end

    else
     
      @request = Request.new(request_params)

      if @request.save
        flash[:notice] = "Request has been made! Please finish up by creating an account."
        redirect_to new_client_registration_path
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

  def add
    @request.add
    flash[:notice] = "this request has been added to your account."
    redirect_to new_request_path
  end

  def display_request
  end

  def my_requests
    @my_requests = current_client.requests.all
  end

  private   

  def set_request
    @request = Request.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "the resource you are looking for can't be found."
    redirect_to root_path
  end

  def request_params
    params.require(:request).permit(:job_description, :phone_number, :location, :date_time, :frequency, :bathrooms, :bedrooms, :hall, :kitchens, :provide)
  end
end
