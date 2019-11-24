# frozen_string_literal: true

class EmailSubscriptionsController < ApplicationController
  def show
    email_to_destroy = EmailSubscription.find_by(uuid: params[:uuid])

    render 'show', locals: { email_to_destroy: email_to_destroy }, layout: 'service'
  end

  def create
    new_sub = EmailSubscription.new(sub_params)
    if new_sub.valid?
      new_sub.save!
      return respond_to do |format|
        format.json { head :ok }
        UserMailer.welcome_for_subscriber(new_sub).deliver_later
      end
    end

    errors = new_sub.errors.details[:email]
    if errors.select { |el| el[:error] == :taken }
      return respond_to do |format|
        format.json { head :conflict } # e.g. 409
      end
    end

    respond_to do |format|
      format.json { head :error }
    end
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
end
