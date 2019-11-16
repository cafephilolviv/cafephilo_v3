class Speaker < ApplicationRecord
  has_many :event_speakers
  has_many :events, through: :event_speakers

  validates :first_name, presence: true
  validates :last_name, presence: true
end
