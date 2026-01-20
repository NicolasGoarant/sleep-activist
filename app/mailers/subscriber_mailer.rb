class SubscriberMailer < ApplicationMailer
  default from: 'nicolas.goarant@hotmail.fr'  # ← Changez ici

  def new_subscriber_notification(subscriber)
    @subscriber = subscriber

    mail(
      to: 'nicolas.goarant@hotmail.fr',  # ← Et ici
      subject: "🎉 Nouvelle inscription à la newsletter - #{subscriber.email}"
    )
  end
end
