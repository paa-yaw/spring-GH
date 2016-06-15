class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update]

  def show
  end

  def new
  	@order = Order.new
  end

  def create 
  	@order = Order.new(order_params)


  	if @order.save
  	  @client = Client.new
  	  @client.email = @order.email
  	  @client.phone_number = @order.phone_number
  	  @client.location = @order.location
  	  @client.password = SecureRandom.hex(5)
  	  @client.admin = false
  	  @client.first_name = @order.email[/[^@]+/]
      @client.last_name = " "
  	  @client.save

  	  flash[:notice] = "you have request has been successfully sent."
  	  redirect_to root_path
  	else
  	  flash.now[:alert] = "your request was not successfully"
  	  render "new"
  	end
  end

  def edit
  end

  def update
  	if @order.update(order_params)
  	  flash[:notice] = "your request has been updated successfully."
  	  redirect_to root_path
  	else
  	  flash.now[:alert] = "oops! something went wrong when updating your request."
  	  render "edit"
  	end
  end

  private

  def order_params
  	params.require(:order).permit(:bathrooms, :bedrooms, :email, :phone_number, :location)
  end

  def set_order
  	@order = Order.find(params[:id])
  rescue ActiveRecord::RecordNotFound
  	redirect_to errors_not_found_path
  end
end
