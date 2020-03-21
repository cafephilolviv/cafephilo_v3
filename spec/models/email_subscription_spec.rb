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

require 'rails_helper'

RSpec.describe EmailSubscription, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
