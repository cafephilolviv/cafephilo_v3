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

class Fact < ApplicationRecord
  validates :number, presence: true
  validates :title, presence: true
end
