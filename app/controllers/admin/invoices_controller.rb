class Admin::InvoicesController < Admin::ApplicationController
  before_action :set_request, except: [:all_requests, :index, :send_invoice_via_email]
  before_action :set_invoice, only: [:show, :edit, :update, :destroy, :send_invoice_via_email]
  
  def index
  	@invoices = Invoice.all
  end

  def show
  end

  def new
  	@invoice = @request.build_invoice
  end

  def create
  	@invoice = @request.build_invoice(invoice_params)
  	@invoice.date_issue = Time.now
  	@invoice.rooms = @request.total_rooms
    
    @request.extra_services.each do |service|
      @invoice.extra_services << service
    end

  	@invoice.package = @request.frequency
  	@invoice.total_amount = @request.total_cost
    @invoice.recipient_email = @request.client.email

  	if @invoice.save
  	  flash[:notice] = "you successfully created an invoice"
  	  redirect_to edit_admin_request_invoice_path(@request, @invoice)
  	else
  		flash.now[:alert] = "you failed to create an invoice"
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @invoice.update(invoice_params)
  	  flash[:notice] = "you successfully updated an invoice"
  	  redirect_to admin_request_invoice_path(@request, @invoice)
  	else
  	  flash.now[:alert] = "you failed to update an invoice."
  	  render 'edit'
  	end
  end 

  def destroy
  end

  def all_requests
  	@requests = Request.joins(:client).where(status: "resolved")
  	@clients = Client.where(admin: false).all
  end

  def send_invoice_via_email
    SendInvoiceJob.set(wait: 2.seconds).perform_later(@request, @invoice)
    redirect_to admin_invoices_path
  end

  private

  def set_invoice
  	@invoice = Invoice.find(params[:id])
  # rescue ActiveRecord::RecordNotFound
  # 	redirect_to errors_not_found_path
  end

  def set_request
  	@request = Request.find(params[:request_id])
  # rescue ActiveRecord::RecordNotFound
  # 	redirect_to errors_not_found_path
  end

  def invoice_params
  	params.require(:invoice).permit(:invoice_to, :invoice_from, :due_date, :date_issue, :due_balance, :amount_paid, :rooms, :extra_services, :package, :total_amount, :recipient_email, :logo, :logo_cache)
  end

end
