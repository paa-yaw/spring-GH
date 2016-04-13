class HomeController < ApplicationController
	before_filter :set_current_client
	before_action :set_current_client
  def index
  end
end
