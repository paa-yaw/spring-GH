class RequestsController < ApplicationController
  include Devise::Controllers::Helpers
  # before_filter :require_client
  # this code is required for request model to have access to current_client
  before_filter :set_current_client
  before_action :set_request, only: [:show, :edit, :update, :destroy, :add, :display_request, :edit_request, :confirmation]

  
  def show
  end

  def new
    if current_client
      @request = current_client.requests.new
    else
      @request = Request.new
    end
  end


  def create


    if current_client

      @request = current_client.requests.new(request_params)

      if @request.save
        flash[:notice] = "#{current_client.email}, your just placed a request!"
        @request.business_algorithm          

        
        # sends email to admin after a logged in client places a request
        Client.where(admin: true).each do |recipient|
          NotifyAdminJob.set(wait: 2.seconds).perform_later(recipient)
        end

        redirect_to confirmation_path(@request)
      else
        flash.now[:alert] = "Your request failed. Please submit it again."
        render 'new'
      end

    else   

      @request = Request.new(request_params)
      if @request.email == "" || @request.phone_number == "" || @request.location == ""
       flash.now[:alert] = "you left out your email, location or number."
       render 'new'
      elsif @request.email != "" && @request.phone_number != "" && @request.location != "" 
      @client = Client.new
      @client.email = @request.email
      @client.phone_number = @request.phone_number
      @client.location = @request.location
      @secure_password = SecureRandom.hex(5)
      @client.password = @secure_password
      @client.admin = false
      @client.first_name = "#{@client.email}"
      @client.last_name = "last name"

        if @request.save
          # transfer of referral_code to user
          if params[:request][:ref_code]
            @referral_code = params[:request][:ref_code]
            @client.referrer_code = @referral_code
            @client.generate_code
          else
            @client.generate_code
          end


          @client.save
          sign_in @client
          @request.client_id = @client.id
          @request.save 
          @request.business_algorithm


              # sends email notification to client after sign up 
              SendEmailJob.set(wait: 5.seconds).perform_later(@client, @secure_password)

               # sends email notification to admin after client sign up
               Client.where(admin: true).each do |recipient|
                NotifyAdminJob.set(wait: 2.seconds).perform_later(recipient, @client)
              end

          # end of referral process, data integrity in Referral model 
          if @client.referrer_code != nil
            @referral = Referral.find_by(email: current_client.email)
            @referral.recipient_id = current_client.id
            @referral.save
          end

          flash[:notice] = "Hi #{current_client.email}, Welcome to Spring."
          redirect_to confirmation_path(@request)              
        else  
          flash.now[:alert] = "something went wrong. Kindly make sure you complete the form before submitting."
          render 'new'
        end
    end


      end
    end 

    def edit
    end 

    def update
      if @request.update(request_params)
        flash[:notice] = "Your request has been updated!"
        @request.business_algorithm
        redirect_to confirmation_path(@request)
      else
        flash.now[:alert] = "An update of your request failed!"
        render 'edit'
      end
    end 

    def destroy
      @request.destroy
      flash[:notice] = "request has been deleted."
      redirect_to new_request_path 
    end



    def edit_request
    end

    def add
      @request.add
      flash[:notice] = "this request has been added to your account."
      redirect_to @request
    end

    def display_request
    end

    def confirmation
    end

    def my_requests
      @my_requests = current_client.requests.all
      @worker = Worker.all
    end

    private   

    def set_request
      @request = Request.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to errors_not_found_path
end

def request_params
  params.require(:request).permit({:weekdays=>[]}, {:extra_services=>[]}, :date_time, :frequency, :bathrooms, :bedrooms, :hall, :kitchens, :email, :phone_number, :location, :terms, :total_rooms, :total_cost, :referral_code)
end
end
