# app/controllers/admin/articles_controller.rb
class Admin::ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :publish, :unpublish]

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to admin_articles_path, notice: 'Article créé avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    # IMPORTANT : Ne pas accéder aux attributs de hero_image avant la sauvegarde
    if @article.update(article_params)
      redirect_to admin_articles_path, notice: 'Article mis à jour avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_path, notice: 'Article supprimé avec succès.'
  end

  def publish
    @article.update(published_at: Time.current) unless @article.published?
    redirect_to admin_articles_path, notice: 'Article publié.'
  end

  def unpublish
    @article.update(published_at: nil)
    redirect_to admin_articles_path, notice: 'Article dépublié.'
  end

  private

  def set_article
    # CORRECTION : Chercher par slug au lieu de par id
    @article = Article.find_by!(slug: params[:id])
  end

  def article_params
    params.require(:article).permit(
      :title,
      :slug,
      :content,
      :category,
      :emoji,
      :hero_image,  # Active Storage gère automatiquement l'upload
      :reading_time,
      :excerpt,
      :published_at
    )
  end
end
