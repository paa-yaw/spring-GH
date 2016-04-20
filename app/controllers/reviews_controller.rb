class ReviewsController < ApplicationController
  before_action :set_worker	

  def create
    @review = @worker.reviews.build(review_params)
    @review.client_id = current_client.id
    @review.save
    redirect_to @worker
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
