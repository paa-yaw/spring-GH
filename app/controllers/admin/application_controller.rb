class Admin::ApplicationController < ApplicationController
  before_action :authorize_admin!
  
  def index
  end

  private

  def authorize_admin!
  	authenticate_client!

  	unless  current_client.admin?
  	  redirect_to root_path, alert: "ONLY AUTHORIZED INDIVIDUALS. You must be an admin."
  	end
  end
end
