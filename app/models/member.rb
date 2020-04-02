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
#  publish     :boolean          default(FALSE)
#

class Member < ApplicationRecord
  has_one_attached :image

  validates :first_name, presence: true
  validates :last_name, presence: true
end
