# frozen_string_literal: true

# == Schema Information
#
# Table name: facts
#
#  id          :bigint           not null, primary key
#  number      :bigint
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Fact, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
