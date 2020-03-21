# frozen_string_literal: true

# == Schema Information
#
# Table name: members
#
#  id          :bigint           not null, primary key
#  first_name  :string
#  last_name   :string
#  position    :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Member, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
