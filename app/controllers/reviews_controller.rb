class ReviewsController < ApplicationController
  before_action :set_worker	
  # before_action :authenticate_client!, only: [:create]

  def create
    @review = @worker.reviews.build(review_params)
    @review.client_id = current_client.id
    @review_count = current_client.reviews.where(worker_id: @worker).count
    if @review_count == 0  
      @review.save 
      redirect_to @worker
    elsif @review_count == 1
      redirect_to @worker
    end

  end

  private

  def set_worker
  	@worker = Worker.find(params[:worker_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to errors_not_found_path
  end

  def review_params
  	params.require(:review).permit(:rating, :comment, :client_id)
  end

end
