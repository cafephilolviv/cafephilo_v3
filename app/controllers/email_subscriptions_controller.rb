# frozen_string_literal: true

class EmailSubscriptionsController < ApplicationController
  around_action :switch_locale

  def show
    email_to_destroy = EmailSubscription.find_by(uuid: params[:uuid])

    render 'show', locals: { email_to_destroy: email_to_destroy }, layout: 'service'
  end

  def create
    new_sub = EmailSubscription.new(sub_params)

    return if valid_subscrition?(new_sub)
    return if invalid_subscription?(new_sub)

    respond_to { |format| format.json { head :error } }
  end

  def destroy
    email_to_destroy = find_email

    if email_to_destroy.destroy!
      redirect_to root_path
    else
      respond_to do |format|
        format.json { head :error }
      end
    end
  end

  private

  def sub_params
    params.require(:email_subscription).permit(:email)
  end

  def find_email
    EmailSubscription.find_by(uuid: params[:uuid])
  end

  def switch_locale(&action)
    # locale = params[:locale] || I18n.default_locale
    I18n.with_locale(:uk, &action)
  end

  def valid_subscrition?(new_sub)
    return unless new_sub.valid?

    capcha = verify_recaptcha(action: 'submit_email')
    return unless capcha

    new_sub.save!
    respond_to do |format|
      format.json { head :ok }
      UserMailer.welcome_for_subscriber(new_sub).deliver_later
    end
  end

  def invalid_subscription?(new_sub)
    errors = new_sub.errors.details[:email]
    return unless errors.select { |el| el[:error] == :taken }

    respond_to do |format|
      format.json { head :conflict } # e.g. 409
    end
  end
end
