class ReportsController < ApplicationController
  
  def create
  	@report = @worker.reports.build(report_params)
  	if @report.save
  	  flash[:notice] = "your report has been saved."
  	  new_request_path
  	else
  	  flash.now[:alert] = "your report failed to save."
      render "form" 
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
