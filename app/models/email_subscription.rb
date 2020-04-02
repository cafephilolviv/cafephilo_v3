# frozen_string_literal: true

# == Schema Information
#
# Table name: email_subscriptions
#
#  id         :bigint           not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  uuid       :uuid
#

class EmailSubscription < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
