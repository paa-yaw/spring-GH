class CommentsController < ApplicationController
  before_action :set_client
  before_action :set_comment, only: [:show, :edit, :update]

  def show
  end

  def new
  	@comment = @client.comments.build
  end

  def create
  	@comment = @client.comments.build(comment_params)

  	if @comment.save
  	  flash[:notice] = "your comment has been successfully created."
  	  redirect_to [@client, @comment]
  	else
  	  flash.now[:alert] = "you couldn't comment. try again."
  	  render 'new'
  	end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = "your comment was updated."
      redirect_to [@client, @comment]
    else
      flash.now[:alert] = "your comment couldn't be updated. try again."
      render 'edit'
    end  
  end


  def 

  private

  def set_comment
  	@comment = Comment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
  	redirect_to errors_not_found_path
  end

  def set_client
  	@client = Client.find(params[:client_id])
  rescue ActiveRecord::RecordNotFound
  	redirect_to errors_not_found_path
  end

  def comment_params
  	params.require(:comment).permit(:content)
  end
end
