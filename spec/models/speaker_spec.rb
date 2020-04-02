# frozen_string_literal: true

# == Schema Information
#
# Table name: speakers
#
#  id         :bigint           not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Speaker, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
