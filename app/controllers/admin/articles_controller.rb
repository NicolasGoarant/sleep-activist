# app/controllers/admin/articles_controller.rb
class Admin::ArticlesController < ApplicationController
  before_action :authenticate_admin! # À adapter selon ton système d'authentification
  before_action :set_article, only: [:show, :edit, :update, :destroy, :publish, :unpublish]

  # GET /admin/articles
  def index
    @articles = Article.all.order(created_at: :desc).page(params[:page]).per(20)
  end

  # GET /admin/articles/new
  def new
    @article = Article.new
  end

  # POST /admin/articles
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to admin_article_path(@article), notice: "Article créé avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /admin/articles/:id
  def show
  end

  # GET /admin/articles/:id/edit
  def edit
  end

  # PATCH /admin/articles/:id
  def update
    if @article.update(article_params)
      redirect_to admin_article_path(@article), notice: "Article mis à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/articles/:id
  def destroy
    @article.destroy
    redirect_to admin_articles_path, notice: "Article supprimé avec succès."
  end

  # POST /admin/articles/:id/publish
  def publish
    if @article.update(published: true, published_at: Time.current)
      redirect_to admin_article_path(@article), notice: "Article publié avec succès."
    else
      redirect_to admin_article_path(@article), alert: "Impossible de publier l'article."
    end
  end

  # POST /admin/articles/:id/unpublish
  def unpublish
    if @article.update(published: false)
      redirect_to admin_article_path(@article), notice: "Article dépublié avec succès."
    else
      redirect_to admin_article_path(@article), alert: "Impossible de dépublier l'article."
    end
  end

  private


  def set_article
  @article = Article.friendly_find(params[:id])
  end

  def article_params
    params.require(:article).permit(
      :title,
      :slug,
      :excerpt,
      :content,
      :emoji,
      :category,
      :reading_time,
      :cover_image_url,
      :cover_gradient,
      :published,
      :author
    )
  end

  def authenticate_admin!
    # À implémenter selon ton système d'authentification
    # Par exemple :
    # redirect_to root_path, alert: "Accès non autorisé" unless current_user&.admin?
  end
end
