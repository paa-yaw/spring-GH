class WorkersController < ApplicationController
  before_action :set_worker, only: [:show]
  before_filter :set_current_client
  # before_action :set_review, only: [:show]
  
  def index
    @current_client_requests = current_client.requests
  end

  def show
    @reviews = Review.where(worker_id: @worker)

    if @reviews.blank?
      @average_rating = 0
    else
      @average_rating = @worker.average_rating
    end
  end


  private

  def set_worker
  	@worker = Worker.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to errors_not_found_path
  end


  def worker_params
  	params.require(:worker).permit(:first_name, :last_name, :sex, :age, :phone_number, :education, 
  	:location, :experience, :minimum_wage, :email, :extra_info)
  end
end
