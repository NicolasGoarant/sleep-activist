# app/models/article.rb
class Article < ApplicationRecord
  # Validations
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :content, presence: true
  validates :category, inclusion: { in: %w[Santé Conseils Parentalité Société], allow_nil: true }
  validates :reading_time, numericality: { only_integer: true, greater_than: 0 }

  # Callbacks
  before_validation :generate_slug, if: -> { slug.blank? }
  before_save :set_published_at, if: -> { published_changed? && published? }

  # Scopes
  scope :published, -> { where(published: true).order(published_at: :desc) }
  scope :drafts, -> { where(published: false).order(updated_at: :desc) }
  scope :by_category, ->(category) { where(category: category) }
  scope :recent, -> { order(created_at: :desc) }

  has_one_attached :hero_image
  # Après les scopes, avant les méthodes d'instance
  def self.friendly_find(param)
    # Essaie de trouver par ID d'abord (si numérique), sinon par slug
    param.to_i.to_s == param ? find(param) : find_by!(slug: param)
  end

  # Méthodes d'instance
  def to_param
    slug
  end

  def published?
    published && published_at.present?
  end

  def draft?
    !published
  end

  def category_color
    case category
    when "Santé"
      "var(--moon-yellow)"
    when "Parentalité"
      "var(--moon-yellow)"
    when "Conseils"
      "var(--soft-lavender)"
    when "Société"
      "var(--soft-lavender)"
    else
      "var(--soft-lavender)"
    end
  end

  def cover_gradient_style
    cover_gradient || "linear-gradient(135deg, rgba(255, 217, 61, 0.2), rgba(184, 181, 232, 0.2))"
  end

  private

  def generate_slug
    base_slug = title.parameterize
    slug_candidate = base_slug
    counter = 1

    while Article.exists?(slug: slug_candidate)
      slug_candidate = "#{base_slug}-#{counter}"
      counter += 1
    end

    self.slug = slug_candidate
  end

  def set_published_at
    self.published_at = Time.current if published_at.blank?
  end
end
