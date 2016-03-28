class Admin::ClientsController < Admin::ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy, :update_admin]


  def index
    @clients = Client.all.where(admin: false)
  end

  def show
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

  def edit
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


  def admin_registration
    @admin = Client.new
  end

  def create_admin
    @admin = Client.new(client_params)

    if @admin.save
      flash[:notice] = "Client successfully created."
      redirect_to admin_list_path
    else
      flash.now[:alert] = "Client could not be created."
      render 'new'
    end 
  end

  def edit_admin
    @client = Client.find(params[:id])
    @admin = @client
  end

  def update_admin
    @admin = @client
    
    if @admin.update(client_params)
      flash[:notice] = "Client has been updated."
      redirect_to admin_list_path
    else
      flash.now[:alert] = "Client could not be updated."
      render 'edit'
    end
  end

  def admin_list
    @admins = Client.all.where(admin: true)
  end

  def client_requests
  end

  private

  def client_params
    params.require(:client).permit(:fullname, :email, :password, :location, :phone_number, :tag, :admin)
  end

  def set_client
    @client = Client.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to errors_not_found_path
  end
end
