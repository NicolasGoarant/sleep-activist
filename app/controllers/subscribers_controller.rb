# app/controllers/subscribers_controller.rb
class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)

    if @subscriber.save
      # Optionnel : envoyer un email de bienvenue
      # SubscriberMailer.welcome(@subscriber).deliver_later

      redirect_to thank_you_subscribers_path, notice: "Merci pour ton inscription ! 🎉"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def thank_you
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email, :first_name, :last_name)
  end
end
