class Admin::ClientsController < Admin::ApplicationController

  def index
    @clients = Client.all.where(admin: false)
  end

  def show
  	@client = Client.find(params[:id])
  end

  def new
    @client = Client.new 
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      flash[:notice] = "Client successfully created."
      redirect_to admin_clients_path
    else
      flash.now[:alert] = "Client could not be created."
      render 'new'
    end 
  end

  def update
    if @client.update(client_params)
      flash[:notice] = "Client has been updated."
      redirect_to admin_clients_path
    else
      flash.now[:alert] = "Client could not be updated."
      render 'edit'
    end
  end


  def client_requests
  	@client = Client.find(params[:id])
  	@client_requests = @client.requests
  end

  private

  def client_params
    params.require(:client).permit(:fullname, :email, :password, :location, :phone_number)
  end

  def set_client
    @client = Client.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to errors_not_found_path
  end
end
