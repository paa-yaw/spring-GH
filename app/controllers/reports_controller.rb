class ReportsController < ApplicationController
  before_action :set_worker	

  def new 
  	@report = @worker.reports.new
  end	
  
  def create
  	@report = @worker.reports.build(report_params)
  	@report.client_id = current_client.id
  	if @report.save
  	  flash[:notice] = "your report has been saved."
  	  redirect_to new_request_path
  	else
  	  flash.now[:alert] = "your report failed to save."
      render "new" 
  	end
  end

  private

  def set_worker
  	@worker = Worker.find(params[:worker_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to errors_not_found_path
  end

  def report_params
  	params.require(:report).permit(:date, :event, :sign)
  end
end
