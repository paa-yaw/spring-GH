class Admin::RequestsController < ApplicationController
  before_action :set_request, only: [:show, :resolve]	
  
  def index
  	@requests = Request.all
  end

  def show
  end

  def resolve
  	@request.resolve

  	flash[:notice] = "This request has been resolved."
  	redirect_to admin_root_path
  end

  private

  def set_request
  	@request = Request.find(params[:id]) 
  end
end
