class Admin::ArticlesController < Admin::ApplicationController
  before_action :set_client, except: [:index]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
  	@articles = Article.all
  end

  def show
  end

  def new
  	@article = @client.articles.build
  end

  def create
  	@article = @client.articles.build(article_params)

  	if @article.save
  	  flash[:notice] = "you successfully created an article."
  	  redirect_to [:admin, @client, @article]
  	else
  		flash.now[:alert] = "ooops. something went wrong in creating the article."
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @article.update(article_params)
  	  flash[:notice] = "you successfully updated your article."
  	  redirect_to [:admin, @client, @article]
  	else
  	  flash.now[:alert] = "ooops. you couldn't update your article."
  	  render 'edit'
  	end
  end

  def destroy
  	@article.destroy
  	flash[:notice] = "you deleted an article."
  	redirect_to admin_articles_path
  end




  private

  def set_article
  	@article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound
  	redirect_to errors_not_found_path
  end

  def set_client
  	@client = Client.find(params[:client_id])
  rescue ActiveRecord::RecordNotFound
  	redirect_to errors_not_found_path
  end

  def article_params
  	params.require(:article).permit(:caption, :content, :picture)
  end
end
