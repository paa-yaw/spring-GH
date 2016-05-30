class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]
  before_filter :set_current_client
  # before_action :set_review, only: [:show]
  
  def index
    if current_client
      @current_client_requests = current_client.requests
    else
    end
  end

  def show
    @reviews = Review.where(worker_id: @worker)

    if @reviews.blank?
      @average_rating = 0
    else
      @average_rating = @worker.average_rating
    end
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)

    if @worker.save
      flash[:notice] = "Registration successfully."
      redirect_to edit_worker_path(@worker)
    else
      flash.now[:alert] = "Registration failed."
      render 'new'
    end
  end


  def edit
  end

  def update
    if @worker.update(worker_params)
      flash[:notice] = "Registration successfully updated."
      redirect_to root_path 
    else
      flash.now[:alert] = "Registration failed to update."
      render 'edit'
    end
  end

  def destroy
  end


  private

  def set_worker
  	@worker = Worker.find(params[:id])
  # rescue ActiveRecord::RecordNotFound
  #   redirect_to errors_not_found_path
  end


  def worker_params
  	params.require(:worker).permit(:first_name, :last_name, :sex, :age, :phone_number, :education, 
  	:location, :experience, :minimum_wage, :email, :extra_info, :attachment, :attachment_cache, :photo, :photo_cache, :status)
  end
end
