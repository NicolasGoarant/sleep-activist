class AdminMailer < ApplicationMailer
  default from: 'no-reply@sleep-activist.fr'

  def new_subscriber_notification(subscriber)
    @subscriber = subscriber
    mail(to: 'nicolas@sleep-activist.fr', subject: 'Nouvelle inscription Newsletter !')
  end
end
