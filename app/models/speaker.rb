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

class Speaker < ApplicationRecord
  has_many :event_speakers
  has_many :events, through: :event_speakers

  validates :first_name, presence: true
  validates :last_name, presence: true
end
