class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :message]

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
  	  @secure_password = SecureRandom.hex(5)
  	  @client.password = @secure_password
  	  @client.admin = false
  	  @client.first_name = @order.email[/[^@]+/]
      @client.last_name = " "
  	  @client.save

  	  @request = Request.new
  	  @request.terms = true
  	  @request.resolved = false
  	  @request.bathrooms = @order.bathrooms
  	  @request.bedrooms = @order.bedrooms
  	  @request.kitchens = 0
  	  @request.hall = 0
  	  @request.weekdays = [""]
  	  @request.extra_services = [nil]
  	  @request.date = 1.day.from_now.to_s
  	  @request.frequency = 150.0
  	  @request.time = 1.day.from_now - 14.hours
  	  @request.status = "unresolved"
  	  @request.save
  	  @client.requests << @request
  	  @client.save

  	   # sends email notification to client after sign up 
  	   SendEmailJob.set(wait: 2.seconds).perform_later(@client, @secure_password)


  	  # flash[:notice] = "you have request has been successfully sent."
  	  redirect_to message_path(@order)
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

  def message
  end

  private

  def order_params
  	params.require(:order).permit(:bathrooms, :bedrooms, :email, :phone_number, :location, :terms)
  end

  def set_order
  	@order = Order.find(params[:id])
  # rescue ActiveRecord::RecordNotFound
  # 	redirect_to errors_not_found_path
  end
end
