class Admin::WorkersController < Admin::ApplicationController
	before_action :set_worker, only: [:show, :edit, :update, :destroy]

  def index
  	@workers = Worker.all
  end

  def show
  end

  def new
  	@worker = Worker.new
  end

  def create
  	@worker = Worker.new(worker_params)

  	if @worker.save
  	  flash[:notice] = "Worker successfully registered."
  	  redirect_to [:admin, @worker]
  	else
  	  flash.now[:alert] = "Registration failed."
  	  render 'new'
  	end
  end

  def edit
  end

  def update
  	if @worker.update(worker_params)
  	  flash[:notice] = "Worker's registration successfully updated."
  	  redirect_to [:admin, @worker] 
  	else
  		flash.now[:alert] = "Worker's registration failed to update."
  		render 'edit'
  	end
  end 

  def destroy
  	@worker.destroy
  	redirect_to admin_root_path
  end

  private

  def set_worker
  	@worker = Worker.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "the resource you are looking for can't be found!"
    redirect_to admin_root_path
  end

  def worker_params
  	params.require(:worker).permit(:first_name, :last_name, :sex, :age, :phone_number, :education, 
  	:location, :experienc, :minimum_age, :email, :extra_info)
  end
end
