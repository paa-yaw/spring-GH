class Admin::ClientsController < ApplicationController

  def index
  	@clients = Client.all.where(admin: false)
  end

  def show
  	@client = Client.find(params[:id])
  end
end
