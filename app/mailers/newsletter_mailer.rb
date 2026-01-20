class NewsletterMailer < ApplicationMailer
  def subscription_notification(subscriber)
    @subscriber = subscriber
    mail(to: "nicolas@sleep-activist.fr", subject: "Nouvelle inscription Newsletter : #{@subscriber.email}")
  end
end
