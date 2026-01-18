# app/controllers/articles_controller.rb
class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  # GET /blog
  def index
    @articles = Article.published.page(params[:page]).per(12)
    @categories = Article.published.pluck(:category).uniq.compact
  end

  # GET /blog/:slug
  def show
    unless @article.published?
      redirect_to blog_path, alert: "Cet article n'est pas encore publié."
    end
    @article.increment!(:views_count)
    @related_articles = Article.published
                               .where(category: @article.category)
                               .where.not(id: @article.id)
                               .limit(3)
  end

  private

  def set_article
    @article = Article.find_by!(slug: params[:slug])
  rescue ActiveRecord::RecordNotFound
    redirect_to blog_path, alert: "Article introuvable."
  end
end
