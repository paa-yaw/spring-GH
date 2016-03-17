class Admin::ClientsController < Admin::ApplicationController

  def index
  	@clients = Client.all.where(admin: false)
  end

  def show
  	@client = Client.find(params[:id])
  end

  def client_requests
  	@client = Client.find(params[:id])
  	@client_requests = @client.requests
  end
end
