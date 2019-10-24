# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  title      :string
#  date       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ApplicationRecord
  has_rich_text :description
  has_many_attached :images

  validates :title, presence: true
  validates :date, presence: true
  validates :description, presence: true
end
