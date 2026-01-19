# app/models/subscriber.rb
class Subscriber < ApplicationRecord
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }

  before_save :downcase_email

  scope :active, -> { where(active: true) }

  private

  def downcase_email
    self.email = email.downcase.strip
  end
end
