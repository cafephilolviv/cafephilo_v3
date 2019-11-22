# frozen_string_literal: true

class EmailSubscriptionsController < ApplicationController
  def create
    new_sub = EmailSubscription.new(sub_params)

    if new_sub.save!
      return respond_to do |format|
        format.json { head :ok }
      end
    end

    respond_to do |format|
      format.json { head :error }
    end
  end

  def destroy
  end

  def sub_params
    params.require(:email_subscription).permit(:email)
  end
end
