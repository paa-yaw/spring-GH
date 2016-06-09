class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  def index
  	@articles = Article.all
  end

  def show
  end

  private

  def set_article
  	@article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound
  	redirect_to errors_not_found_path
  end

  def article_params
  	params.require(:article).permit(:caption, :content, :picture, :caption_photo, :caption_photo_cache)
  end
end
